#
# Cookbook Name:: s3cmd
# Recipe:: default
#
# Frederico Araujo (fred.the.master@gmail.com)
# https://github.com/fred/chef-s3cmd
#

# Url to download the tarball from latest master branch from github.
default['s3cmd']['url'] = 'https://github.com/s3tools/s3cmd/archive/master.tar.gz'

default['s3cmd']['gpg_passphrase'] = 'averylongsupersecretpassphrase'
default['s3cmd']['secret_key'] = 'your-secret-key'
default['s3cmd']['access_key'] = 'your-access-key'
default['s3cmd']['bucket_location'] = 'US'

default['s3cmd']['user'] = 'deploy'
default['s3cmd']['home'] = '/home/deploy'
