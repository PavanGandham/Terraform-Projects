#!/bin/bash -ex
yum -y update
yum install -y 
httpd php mysql php-mysql git
chkconfig httpd on
service httpd start
git clone https://github.com/CJ-Regan/Terraform-AWS-3tier-Architecture.git
cd Terraform-AWS-3tier-Architecture/Resources
mv app.tgz app.tar.gzcp app.tar.gz /var/www/html
cd /var/www/html
tar -zxvf app.tar.gz
chown apache:root /var/www/html/rds.conf.php
