# hibp.sh

A bash script that uses the [haveibeenpwned RESTful API](https://haveibeenpwned.com/API/v2) to check for occurrences of a password in the list of compromised accounts.

It uses the [Search by range service](https://haveibeenpwned.com/API/v2#SearchingPwnedPasswordsByRange) of the API which protects the value of the tested password:

>In order to protect the value of the source password being searched for, Pwned Passwords also implements a k-Anonymity model that allows a password to be searched for by partial hash. This allows the first 5 characters of a SHA-1 password hash (not case-sensitive) to be passed to the API...
