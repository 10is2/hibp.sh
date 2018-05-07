#!/bin/bash

#
# hibp.sh
#
# checks the haveibeenpwned api for occurences of a password
#
# only the first 5 characters of a sha1 hash of the password
# will be transmitted to the api, which responds with all
# hashes that start with those 5 characters
#

# read password
echo
echo -n "enter password to check: "
read -s pw
echo 

# generate sha1 hash from password
hash_full=`echo -n $pw | sha1sum | awk '{print toupper($1)}'`

# split hash into a prefix with 5 chars and a postfix with the rest of the chars
hash_pre=${hash_full:0:5}
hash_post=${hash_full:5}

# send hash prefix to the api and check if the postfix is in the response
response=`curl -s "https://api.pwnedpasswords.com/range/$hash_pre" | grep "$hash_post"`

# check if response is empty
if [ -z $response ]; then
	echo "no matches found."

# the number of occurences of the password is in the response seperated by a :
else
	occ=`echo $response | cut -d':' -f2 | tr -d '\r'`
	echo "matches found with $occ occurences. password is not safe!"
fi

echo
