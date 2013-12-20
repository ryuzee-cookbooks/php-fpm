#
# Cookbook Name:: php-fpm 
# Recipe:: default 
#
# Author:: Ryuzee <ryuzee@gmail.com>
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

case node["platform"]
when "centos", "redhat", "amazon", "scientific", "fedora"

  if node["platform"] == "centos" 
    include_recipe "yum-epel"
  end

  %w{php-fpm php-pecl-apc}.each do |pkg|
    package pkg do
      action :install
    end
  end

  service "php-fpm" do
    action [:enable, :start]
  end
end

