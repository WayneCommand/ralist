#!/bin/bash

# setting permission.
chown -R ${PUID}:${PGID} /opt/alist/
umask ${UMASK}

# start caddy server 5244 -> 10000
service caddy start
echo 'web server started!'

if [ "$1" = "version" ]; then
  ./alist version
else
  exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
fi