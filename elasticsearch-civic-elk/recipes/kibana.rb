#
# Cookbook:: elasticsearch-civic-elk
# Recipe:: kibana
#
# Copyright:: 2017, The Authors, All Rights Reserved.

kibana5_install 'kibana' do
  version '5.2.2'
end

kibana5_configure 'kibana' do
  configuration 'server.port' => 5601,
                'server.host' => localhost,
                'elasticsearch.url' => 'http://localhost:9200',
                'logging.dest' => '/var/log/kibana.log'
end

node.default['nginx']['default_site_enabled'] = false
include_recipe 'chef_nginx'

nginx_site 'kibana' do
  template 'nginx-site.conf.erb'
  variables(
    listen_address: '0.0.0.0',
    listen_port: '80',
    server_name: 'kibana.test',
    kibana_port: '5601'
  )
end
