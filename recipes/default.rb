#
# Cookbook Name:: s3cmd
# Recipe:: default
# Frederico Araujo (fred.the.master@gmail.com)
# https://github.com/fred/chef-s3cmd
#

package "python"
package "python-setuptools"
package "python-distutils-extra"
package "python-dateutil"
package "python-requests"

package "s3cmd"

if node['s3cmd']['config_dir']
  home_folder = node['s3cmd']['config_dir']
else
  home_folder = node['etc']['passwd'][node['s3cmd']['user']]['dir']
end

template "#{home_folder}/.s3cfg" do
  source "s3cfg.erb"
  variables(
    :access_key =>  node['s3cmd']['access_key'],
    :secret_key =>  node['s3cmd']['secret_key'],
    :gpg_passphrase =>  node['s3cmd']['gpg_passphrase'],
    :bucket_location =>  node['s3cmd']['bucket_location'],
    :https =>  node['s3cmd']['https'],
    :encrypt =>  node['s3cmd']['encrypt']
  )
  owner node['s3cmd']['user']
  group node['s3cmd']['user']
  mode 0600
end
