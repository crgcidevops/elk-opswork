
include_recipe 'java'

yum_repository 'elastic5' do
  description "Elastic repository for 5.x packages"
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
  enabled true
  gpgcheck true
  action :create
end



yum_package 'logstash'


template '/etc/logstash/conf.d/logstash_indexer.conf' do
  source 'logstash_indexer/logstash_indexer.conf.erb'
  # owner 'root'
  # group 'root'
  # mode '0755'
end

execute 'start_service' do
  command 'initctl start logstash || echo "Already started"'
end

execute 'start_service' do
  command 'initctl restart logstash'
end
