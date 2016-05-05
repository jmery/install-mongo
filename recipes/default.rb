#
# Cookbook Name:: install-mongo
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Let's install us some mongo!

case node['platform_family']
when 'debian'
  apt_repository 'mongodb' do
    uri 'http://repo.mongodb.org/apt/ubuntu'
    distribution "#{node['lsb']['codename']}/mongodb-org/3.2"
    components ['multiverse']
    keyserver 'keyserver.ubuntu.com'
    key 'EA312927'
  end
when 'rhel'
  yum_repository 'mongodb' do
    description 'MongoDB Repository'
    baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/'
    gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
    action :create
  end
end

package 'mongodb-org'

service 'mongod' do
  action [:enable, :start]
end
