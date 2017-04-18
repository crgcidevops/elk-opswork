#
# Cookbook:: elasticsearch-civic-elk
# Recipe:: kibana
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
  allocated_memory '2048m'
  configuration ({
    'cluster.name' => 'mycluster',
    #'node.name' => 'node01',
    'network.host' => '0.0.0.0',

    'http.cors.enabled' => true,
    'http.cors.allow-origin' => '/https?:\/\/localhost(:[0-9]+)?/',
    'http.cors.allow-credentials' => true,
    'http.cors.allow-headers' => 'X-Requested-With,X-Auth-Token,Content-Type, Content-Length, Authorization',
    'cloud' => {
      'aws' => {
          'access_key' => node['access_key'],
          'secret_key' => node['secret_key'],
          'region' => node['region']
        }
      },

    'discovery' =>  {'zen.hosts_provider' => 'ec2' },

    'cloud.node.auto_attributes' => true,
    'cluster.routing.allocation.awareness.attributes' => 'aws_availability_zone',
    'discovery.ec2.groups' => 'elasticsearch'

  })
end



#elasticsearch_plugin 'head' do
#  url 'mobz/elasticsearch-head'
#  notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
#end

elasticsearch_plugin 'discovery-ec2' do
  url 'discovery-ec2'
  #notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
end

elasticsearch_service 'elasticsearch' do
  #service_actions [:enable, :start]
end
