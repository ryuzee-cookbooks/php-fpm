#
# Cookbook Name:: php-fpm 
# Recipe:: nginx 
#
# Author:: Ryuzee <ryuzee@gmail.com>
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
include_recipe "nginx"

template 'php.conf' do
  path '/etc/nginx/conf.d/server/php.conf'
  source 'php.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, "service[nginx]"
end

template 'phpinfo.php' do
  path '/usr/share/nginx/html/phpinfo.php'
  source 'phpinfo.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
  only_if {node["php-fpm"]["nginx"]["release_test_script"]}
end

service "nginx" do
  service_name "nginx"
  restart_command "service nginx restart"
end
