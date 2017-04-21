# docker_service 'default' do
#   action [:create, :start]
# end

# docker_image 'busybox' do
#   action :pull
# end

# docker_container 'an-echo-server' do
#   repo 'busybox'
#   port '1234:1234'
#   command "nc -ll -p 1234 -e /bin/cat"
# end

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


template '/etc/logstash/conf.d/default.conf' do
  source 'logstash_indexer/logstash.conf.erb'
  # owner 'root'
  # group 'root'
  # mode '0755'
end

execute 'start_service' do
  command 'initctl start logstash || echo "Already started"'
end

execute 'start_service' do
  command 'initctl reload logstash'
end
