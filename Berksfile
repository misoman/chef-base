# -*- mode: ruby -*-
# vi: set ft=ruby :
Encoding.default_external = "UTF-8"
source 'https://supermarket.chef.io'

cookbook 'ubuntu'
cookbook 'apt'
cookbook 'git'
cookbook 'monit', git: 'https://github.com/phlipper/chef-monit.git'
cookbook 'firewall'
cookbook 'ntp'
cookbook 'sudo'
cookbook 'timezone-ii'
cookbook 'windows'

cookbook 'haproxy', git: 'https://github.com/hw-cookbooks/haproxy.git', ref: 'a42d14ee291a95b68f79b50e46bcd6eefdb25a35'
cookbook 'keepalived'
cookbook 'varnish'
cookbook 's3_file'
cookbook 'apache2', git: 'https://github.com/joelhandwell/chef-apache2.git'
cookbook 'php'
cookbook 'xdebug', git: 'https://github.com/joelhandwell/xdebug.git'
cookbook 'phpmyadmin', git: 'https://github.com/priestjim/chef-phpmyadmin.git', ref: '0a8cef411aaa79420576f62a25f1e53a2e1b6e06'
cookbook 'memcached'
cookbook 'mysql'
cookbook 'percona', '~> 0.16.1'
cookbook 'xinetd', git: 'https://github.com/joelhandwell/cookbook-xinetd.git'
cookbook 'nfs'
cookbook 'cron'

group :wrapper do
  cookbook 'w_common', git: 'https://github.com/haapp/w_common.git'
  cookbook 'w_haproxy', git: 'https://github.com/haapp/w_haproxy.git'
  cookbook 'w_varnish', git: 'https://github.com/haapp/w_varnish.git'
  cookbook 'w_apache', git: 'https://github.com/haapp/w_apache.git'
  cookbook 'w_memcached', git: 'https://github.com/haapp/w_memcached.git'
  cookbook 'w_percona', git: 'https://github.com/haapp/w_percona.git'
  cookbook 'w_mysql', git: 'https://github.com/haapp/w_mysql.git'
  cookbook 'w_nfs', git: 'https://github.com/haapp/w_nfs.git'
end
