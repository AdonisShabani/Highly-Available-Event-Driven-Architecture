#!/bin/bash
yum update -y
service httpd start
chkconfig httpd on