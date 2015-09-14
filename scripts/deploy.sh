#!/bin/sh
ssh root@ubvoting.com -i /home/travis/build/bobmshannon/UBVoting/.travis/deploy_id_rsa 'git clone git@github.com:bobmshannon/UBVoting.git tmp' | 'rm -rf /var/www/ubvoting.com/public_html/*' | 'cp -R tmp/webroot/* /var/www/ubvoting.com/public_html/' | 'chmod 0755 /var/www/ubvoting.com/public_html/' | 'rm -rf tmp/'
