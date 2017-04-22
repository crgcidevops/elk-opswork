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

# service "logstash" do
#   action :start
#   reload_command  "initctl reload logstash"
#   restart_command "initctl restart logstash"
# #  service_name               String # defaults to 'name' if not specified
#   start_command "initctl start logstash"
#   status_command "initctl status logstash"
#   stop_command "initctl stop logstash"

# end


template '/etc/logstash/conf.d/logstash_receiver.conf' do
  source 'logstash_receiver/logstash_receiver.conf.erb'
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


zookeeper '3.4.10' do
  username 'zookeeper'
  mirror   'http://apache.mirrors.hoobly.com/zookeeper'
  #checksum 'f10a0b51f45c4f64c1fe69ef713abf9eb9571bc7385a82da892e83bb6c965e90'
  action   :install
end

include_recipe 'zookeeper::config_render'
include_recipe 'zookeeper::service'

include_recipe 'kafka::default'
