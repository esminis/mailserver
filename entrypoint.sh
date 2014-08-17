#!/bin/bash
service rsyslog start
service postfix start
vm-pop3d --daemon=1 --user tequila --group tequila
service stunnel4 start
service tequila start
exec "$@"