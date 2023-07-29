#!/bin/sh
# set -x

yum -y install sendmail mailutils mailx sendmail-bin sendmail-cf cyrus-sasl-plain
mkdir -m 700 /etc/mail/authinfo/
cd /etc/mail/authinfo/

echo 'AuthInfo: "U:root" "I:USER@gmail.com" "P:PASSWORD"' >> /etc/mail/authinfo/gmail-idpass

makemap hash gmail-idpass < gmail-idpass
#rm -fr /etc/mail/sendmail.mc
#wget -P /etc/mail/ http://file.7yro.net/meem/meemradius/sendmail.mc

make -C /etc/mail

/etc/init.d/sendmail reload


sed -i "s/mailname/USER/g" /var/www/html/radiusmanager/config/system_cfg.php
sed -i "s/mailpassword/PASSWORD/g" /var/www/html/radiusmanager/config/system_cfg.php
sed -i "s/localhost.localdomain/127.0.0.1/g" /etc/radiusmanager.cfg

history -c
