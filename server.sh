#!/bin/sh

wget https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm
rpm -Uvh ./chef-server-core-*
chef-server-ctl reconfigure
chef-server-ctl user-create chefuser chef user chefuser@mail.com 'password' --filename ~/chefuser.pem
chef-server-ctl org-create short_name 'org' --association_user chefuser --filename org-validator.pem