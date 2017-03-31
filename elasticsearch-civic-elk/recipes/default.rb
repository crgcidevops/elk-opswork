#
# Cookbook:: elasticsearch-civic-elk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'

elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type 'package'
  version "5.2.2"
  action :install
end

elasticsearch_configure 'elasticsearch' do
  allocated_memory '512m'
  configuration ({
  'cluster.name' => 'mycluster',
  'node.name' => 'node01',
  'http.cors.enabled' => 'true',
  'http.cors.allow-origin' => "/https?:\/\/localhost(:[0-9]+)?/",
  'http.cors.allow-credentials' => 'true',
  'http.cors.allow-headers' => 'X-Requested-With,X-Auth-Token,Content-Type, Content-Length, Authorization'
  })
end

elasticsearch_service 'elasticsearch' do
  #service_actions [:enable, :start]
end

#elasticsearch_plugin 'head' do
#  url 'mobz/elasticsearch-head'
#  notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
#end
