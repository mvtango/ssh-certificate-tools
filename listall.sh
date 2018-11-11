#! /bin/bash

for a in $(sudo find /etc/letsencrypt/live/ -name 'cert.pem'); do
	printf "\n--------------------------\n$a\n"
	sudo openssl x509 -text -noout -in $a
done

