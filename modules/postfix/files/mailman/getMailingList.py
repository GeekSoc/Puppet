#!/usr/bin/env python

# Syncs geeksoc member list with mailman annouce list:
# ./getMailingList.py | sync_members --welcome-msg=no --goodbye-msg=no --notifyadmin=yes --file - announce

import httplib2
import json
import os

h = httplib2.Http(".cache")

GAS_USER = os.environ['GAS_USER']
GAS_PASS = os.environ['GAS_PASS']

h.add_credentials(GAS_USER, GAS_PASS) 
resp, content = h.request("http://api.accounts.geeksoc.org/users/", "GET")

paid_members = json.loads(content)

for member in paid_members:
    if member['status'] != 'Expired' and member['status'] != 'Administratively Disabled':
        print member['email']
        
resp, content = h.request("http://api.accounts.geeksoc.org/newmembers", "GET")

new_members = json.loads(content)

for new_member in new_members:
    print new_member['email']
