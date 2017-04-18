#
# Cookbook:: elasticsearch-civic-elk
# Recipe:: kibana
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'

yum_repository 'elastic5' do
  description "Elastic repository for 5.x packages"
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
  enabled true
  gpgcheck true
  action :create
end

yum_package 'kibana'


execute 'start_service' do
  command 'service kibana start || echo "Already started"'
end

execute 'start_service' do
  command 'service kibana reload'
end

#node.default['nginx']['default_site_enabled'] = false
#include_recipe 'chef_nginx'

#nginx_site 'kibana' do
#  template 'nginx-site.conf.erb'
#  variables(
#    listen_address: '0.0.0.0',
#    listen_port: '80',
#    server_name: 'kibana.test',
#     kibana_port: '5601'
#   )
# end
