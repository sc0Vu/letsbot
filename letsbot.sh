#!/bin/bash

RENEW=7
TODAY=`date '+%Y_%m_%d'`

if ! openssl x509 -checkend $[ 86400 * $RENEW ] -noout -in /path/to/signed.crt ; then
  # cp /path/to/signed.crt /path/to/old/signed_backup_$TODAY.crt
  ./path/to/renew.sh
fi