#
# Cookbook Name:: s3cmd
# Recipe:: default
# Frederico Araujo (fred.the.master@gmail.com)
# https://github.com/fred/chef-s3cmd
#

# install s3cmd based on your configuration
case node['s3cmd']['install_method']
  when 'source'
    include_recipe 's3cmd::install_from_source'
  when 'package'
    include_recipe 's3cmd::install_from_package'
  else
    Chef::Application.fatal!("There install method #{node['s3cmd']['install_method']} is not provided; please use one of: 'source', 'package'.")

# configure s3cmd
include_recipe 's3cmd::configure'
