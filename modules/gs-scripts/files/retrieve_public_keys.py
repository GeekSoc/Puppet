#!/usr/bin/python

import os, sys, ldap
import codecs
import syslog
from shutil import move, rmtree, copytree

def _chown(arg, dir_name, files):
    os.chown(dir_name, arg[0], arg[1])
    for file in files:
        os.chown(os.path.join(dir_name, file), arg[0], arg[1])

def _create_home_dir(user, path, uid, gid):
    if not os.path.exists(path):
        syslog.syslog("Creating home directory for " + user)
        copytree('/etc/skel/', path)
        os.path.walk(path, _chown, [int(uid), int(gid)])

def retrieve_keys():
    try:
        l = ldap.open("ldap.geeksoc.org")
        l.protocol_version = ldap.VERSION3
    except ldap.LDAPError, e:
        syslog.syslog(str(e))

    baseDN = "ou=People, dc=geeksoc, dc=org"
    searchScope = ldap.SCOPE_SUBTREE
    retrieveAttributes = None
    searchFilter = "(sshPublicKey=*)"

    try:
        results = l.search_s(baseDN, searchScope, searchFilter, retrieveAttributes)
        if (len(results) == 0):
            sys.exit(1)
        for dn, entry in results:
            user = entry['uid'][0]
            uid = entry['uidNumber'][0]
            gid = entry['gidNumber'][0]
            home = entry['homeDirectory'][0]
            keys = entry['sshPublicKey']

            ssh_dir =  os.path.join(home, ".ssh")
            key_file = os.path.join(ssh_dir, "authorized_keys")

            key = []
            for k in keys:
                key.append(k)
            key = "\n".join(key)

            _create_home_dir(user, home, uid, gid)

            if not os.path.exists(ssh_dir):
                syslog.syslog("Creating " + ssh_dir)
                os.makedirs(ssh_dir, mode=0700)
                os.chown(ssh_dir, int(uid), int(gid))
                #os.path.walk(home_dir, _chown, [int(uid), int(gid)])

            f = codecs.open(key_file, mode='a+', encoding='utf-8')
            if f.read() != key + '\n':
                syslog.syslog("Writing out key file: " + key_file)
                f.truncate(0)
                f.write(key + '\n')
                f.close()
                os.chmod(key_file, 0600)
                os.chown(key_file, int(uid), int(gid))

    except ldap.LDAPError, e:
        syslog.syslog(str(e))

if __name__ == '__main__':
    try:
        retrieve_keys()
    except Exception, e:
        syslog.syslog(str(e))
        