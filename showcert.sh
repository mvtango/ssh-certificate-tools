#! /bin/bash

set -Eeuo pipefail

showcert() {
 curl --insecure -v https://$1 2>&1 | sed -n '/^\* SSL/,/^\* ALPN/p'
}

showcert_o() {
	echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text
}

for A in $*; do 
	showcert_o $A
done

