GeekSoc Administration Scripts
=============================

This is a small collection of scripts to help with the deployment and administration of GeekSoc servers.

LDAP
----
Various scripts to help with managing the LDAP members database.

### gsruntime
Based on the ldapscripts runtime - various helper functions.

### gsadduser
Based on ldapadduser - modified to always add users to the 'members' group and email their details to them.

### gsuser.template
The LDIF template file for gsadduser

### gsparseldif
Takes LDIF input (i.e. from ldapsearch) and presents in a format suitable for submission to C&S: Name, Student Number, Email.
Also shows status of account (Expired, Expiring in the next 60 days, not paid etc.)
