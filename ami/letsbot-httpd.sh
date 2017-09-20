#! /bin/bash
# It's auto renew for certonly --standalone
RENEW=false
RENEWDAYS=7
NOW=$(date +"%Y-%m-%d"+"%T")

echo "[$NOW] letsbot started";

for dir in /etc/letsencrypt/live/*/; do
  if [ -d "$dir" ]; then
    for file in "$dir*cert.pem"; do
      if ! openssl x509 -checkend $[ 86400 * $RENEWDAYS ] -noout -in $file; then
        echo "Outdated cert: $file";
        RENEW=true;
      fi
    done
  else 
    echo "there is no live certificate in /etc/letsencrypt";
  fi
done

if $RENEW; then
  echo "start renew certs";
  service httpd stop;
  /usr/share/certbot-auto --debug --no-self-upgrade renew
  service httpd start;
  echo "success to renew certs";
else
  echo "nothing to renew";
fi