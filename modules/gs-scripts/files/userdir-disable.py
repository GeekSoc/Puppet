#!/usr/bin/python

import os, sys, ldap, time

time = int(time.time()/(60*60*24))

try:
        l = ldap.open("ldap.geeksoc.org")
        l.protocol_version = ldap.VERSION3
except ldap.LDAPError, e:
        print e

baseDN = "ou=People, dc=geeksoc, dc=org"
searchScope = ldap.SCOPE_SUBTREE
retrieveAttributes = ["uid", "homeDirectory", "shadowExpire"]
searchFilter = "(shadowExpire=*)"

try:
    ldap_result_id = l.search(baseDN, searchScope, searchFilter,retrieveAttributes)
    result_set = []
    while 1:
        result_type, result_data = l.result(ldap_result_id, 0)
        if (result_data == []):
            break
        else:
            if result_type == ldap.RES_SEARCH_ENTRY:result_type
            
            username =  result_data[0][1]['uid'][0]
            homedir = result_data[0][1]['homeDirectory'][0]
            expiry = result_data[0][1]['shadowExpire'][0]
            
            if int(expiry) <= time:
				print "Disabling " + username
                os.chmod(homedir, 0000)

except ldap.LDAPError, e:
    print e
