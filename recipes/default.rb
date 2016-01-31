#
# Cookbook Name:: s3cmd
# Recipe:: default
# Frederico Araujo (fred.the.master@gmail.com)
# https://github.com/fred/chef-s3cmd
#

package 'python'
package 'python-setuptools'
package 'python-distutils-extra'
package 'python-dateutil'
package 'python-requests'

package 's3cmd'

if node['s3cmd']['config_dir']
  home_folder = node['s3cmd']['config_dir']
else
  home_folder = node['etc']['passwd'][node['s3cmd']['user']]['dir']
end

include_recipe 'chef-vault'

begin
  # First try to load s3 config through Chef Vault, as the more secure way.
  s3cfg_variables = {
    access_key: chef_vault_item_for_environment('aws_creds', 's3_user')['access_key'],
    secret_key: chef_vault_item_for_environment('aws_creds', 's3_user')['secret_key'],
    gpg_passphrase: chef_vault_item_for_environment('aws_creds', 's3_user')['gpg_passphrase'],
    bucket_location: chef_vault_item_for_environment('aws_creds', 's3_user')['bucket_location'],
    https: chef_vault_item_for_environment('aws_creds', 's3_user')['https'],
    encrypt: chef_vault_item_for_environment('aws_creds', 's3_user')['encrypt']
  }
rescue ChefVault::Exceptions::KeysNotFound, Net::HTTPServerException => e
  if e || e.response_code == '404'
    # if we couldn't find the data bag, revert to plain node attributes
    s3cfg_variables = {
      access_key: node['s3cmd']['access_key'],
      secret_key: node['s3cmd']['secret_key'],
      gpg_passphrase: node['s3cmd']['gpg_passphrase'],
      bucket_location: node['s3cmd']['bucket_location'],
      https: node['s3cmd']['https'],
      encrypt: node['s3cmd']['encrypt']
    }
  end
end


template "#{home_folder}/.s3cfg" do
  source 's3cfg.erb'
  variables s3cfg_variables
  owner node['s3cmd']['user']
  group node['s3cmd']['user']
  mode 0600
end
