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
  description "Elastic repository for 5.2 packages"
  baseurl "https://artifacts.elastic.co/packages/5.2/yum"
  gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
  enabled true
  autorefresh true
  gpgcheck true
  type "rpm-md"
  action :create
end



yum_package 'logstash'
