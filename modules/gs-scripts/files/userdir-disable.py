#!/usr/bin/python

import os, sys, ldap, time
import syslog

time = int(time.time()/(60*60*24))

try:
	l = ldap.open("ldap.geeksoc.org")
	l.protocol_version = ldap.VERSION3
except ldap.LDAPError, e:
	syslog.syslog(e)

baseDN = "ou=People, dc=geeksoc, dc=org"
searchScope = ldap.SCOPE_SUBTREE
retrieveAttributes = ["uid", "homeDirectory", "shadowExpire"]
searchFilter = "(shadowExpire=*)"

try:
    results = l.search_s(baseDN, searchScope, searchFilter, retrieveAttributes)
    for dn, entry in results:
        username = entry['uid'][0]
        homedir = entry['homeDirectory'][0]
        expiry = entry['shadowExpire'][0]

        if int(expiry) <= time:
            syslog.syslog("Disabling " + username)
            os.chmod(homedir, 0700)

except ldap.LDAPError, e:
	syslog.syslog(e)

