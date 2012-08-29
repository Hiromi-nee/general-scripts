#!/usr/bin/python

import urllib
userid = ""
passw = ""
params = urllib.urlencode( {'username' : userid, 'password' : passw, 'buttonClicked' : 4} )
fd = urllib.urlopen("", params) #url for the Cisco login page.
content = ""
try:
    content = fd.read()
except:
    print "Unable to read"

if content.find("Login Successful") > 1:
    print "Login Successful"
elif content.find("You are already logged in.") > 1:
    print "Already logged in."
elif content.find("The User Name and Password combination you have entered is invalid.") > 1:
    print "Incorrect details."
else:
    print "Derped."
