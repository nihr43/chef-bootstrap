#!/bin/sh
#
## quick setup and creation of example repo

yum install wget ruby git -y
wget https://packages.chef.io/files/stable/chefdk/3.3.23/el/7/chefdk-3.3.23-1.el7.x86_64.rpm
rpm -Uhv ./chefdk-3.3.23-1.el7.x86_64.rpm

chef generate repo chef-repo
mkdir -p ~/chef-repo/.chef

cat > ~/chef-repo/.chef/knife.rb << EOF_KNIFE
current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "testuser"
client_key                "#{current_dir}/chef_key.pem"
chef_server_url           "https://chef-master.localdomain/organizations/org"
cookbook_path             ["#{current_dir}/../cookbooks"]
EOF_KNIFE


echo "/n/nchefdk setup nearly finished.  you need to set your username, key, and chef server url"
