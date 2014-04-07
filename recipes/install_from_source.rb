#
# Cookbook Name:: s3cmd
# Recipe:: install_from_source
# Frederico Araujo (fred.the.master@gmail.com)
# https://github.com/fred/chef-s3cmd
#

package "python"
package "python-setuptools"
package "python-distutils-extra"
package "python-dateutil"


remote_file "#{Chef::Config[:file_cache_path]}/master.tar.gz" do
  source node['s3cmd']['url']
  mode "0644"
end

bash "install-s3cmd" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  tar xzvf master.tar.gz
  cd s3cmd-master
  python setup.py install
  EOH
end

if node['s3cmd']['config_dir']
  home_folder = node['s3cmd']['config_dir']
else
  home_folder = node['etc']['passwd'][node['s3cmd']['user']]['dir']
end
