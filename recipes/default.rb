#
# Cookbook Name:: nginx-cookbook
# Recipe:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

package 'nginx' do
  package_name 'nginx'
  #source 'http://nginx.org/packages/ubuntu/dists/bionic/'
end

service 'nginx' do
  action :start
end

template 'index.html' do
  path '/var/www/html/index.html'
  source 'index.html.erb'
end
