#!/bin/bash
service rsyslog start
service postfix start
vm-pop3d --daemon=1
service tequila start
exec "$@"