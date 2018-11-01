#!/bin/sh

hostnamectl set-hostname chef-server.localdomain

wget https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm
rpm -Uvh ./chef-server-core-*
chef-server-ctl reconfigure
chef-server-ctl user-create chefuser chef user chefuser@mail.com 'password' --filename ~/chefuser.pem
chef-server-ctl org-create org "org" --association_user chefuser --filename org-validator.pem

echo "10.0.0.10 chef-server.localdomain" >> /etc/hosts
echo "chef server setup done.  you need to check /etc/hosts"
