#! /bin/bash
# It's auto renew for certonly --standalone
RENEW=false
RENEWDAYS=7

for dir in /etc/letsencrypt/live/*/; do
  for file in "$dir*cert.pem"; do
    if ! openssl x509 -checkend $[ 86400 * $RENEWDAYS ] -noout -in $file; then
      echo $file;
      RENEW=true;
    fi
  done
done

if $RENEW; then
  echo "start renew certs";
  nginx -s stop;
  /usr/share/certbot-auto --debug --no-self-upgrade renew
  nginx;
  echo "success to renew certs";
fi