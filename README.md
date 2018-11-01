# chef-bootstrap
Clone and run to provision a simple Chef server


##### Check Connection
 - knife ssl fetch

##### Setup nodes
 - ensure clients can resolve fqdn of chef-server

##### Adding a node
 - knife bootstrap 10.0.0.100 -N node-0
 - knife node run_list add node-0 'recipe[centos_common]'
 - ssh 10.0.0.100 -- chef-client

##### Node info
 - knife node list
 - knife node show node-0


##### Creating or updating a cookbook
 - chef generate cookbook centos_common
 - knife cookbook upload --all
