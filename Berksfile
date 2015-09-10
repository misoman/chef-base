# -*- mode: ruby -*-
# vi: set ft=ruby :
Encoding.default_external = "UTF-8"
source 'https://supermarket.chef.io'

cookbook 'ubuntu'
cookbook 'apt'
cookbook 'apt-repo', git: 'https://github.com/sometimesfood/chef-apt-repo.git'
cookbook 'git'
cookbook 'monit', git: 'https://github.com/phlipper/chef-monit.git'
cookbook 'firewall', git: 'https://github.com/opscode-cookbooks/firewall.git', ref: '3c4832f3498141287981a8687855531b0d746fc9'
cookbook 'ntp'
cookbook 'sudo'
cookbook 'timezone-ii'
cookbook 'vmware-tools', git: 'https://github.com/tamucookbooks/vmware-tools.git'
cookbook 'windows'

cookbook 'haproxy', git: 'https://github.com/fulloflilies/haproxy.git', ref: '27a1e4646c2a83bb94be3b7b32cd4865f28b010f'
cookbook 'keepalived'
cookbook 'varnish'
cookbook 's3_file'
cookbook 'apache2'
cookbook 'php', git: 'https://github.com/joelhandwell/chef-php.git'
cookbook 'php-fpm', git: 'https://github.com/yevgenko/cookbook-php-fpm.git'
cookbook 'xdebug', git: 'https://github.com/joelhandwell/xdebug.git'
cookbook 'phpmyadmin', git: 'https://github.com/priestjim/chef-phpmyadmin.git', ref: '0a8cef411aaa79420576f62a25f1e53a2e1b6e06'
cookbook 'memcached'
cookbook 'mysql'
cookbook 'percona', '~> 0.16.1'
cookbook 'xinetd', git: 'https://github.com/joelhandwell/cookbook-xinetd.git'
cookbook 'nfs'
cookbook 'cron'

group :wrapper do
  cookbook 'w_common', git: 'https://github.com/haapp/w_common.git', ref: '01c3d2f170e678395bb9e5f0fdb220c73a080afd'
  cookbook 'w_haproxy', git: 'https://github.com/haapp/w_haproxy.git'
  cookbook 'w_varnish', git: 'https://github.com/haapp/w_varnish.git'
  cookbook 'w_apache', git: 'https://github.com/haapp/w_apache.git'
  cookbook 'w_memcached', git: 'https://github.com/haapp/w_memcached.git'
  cookbook 'w_percona', git: 'https://github.com/haapp/w_percona.git'
  cookbook 'w_mysql', git: 'https://github.com/haapp/w_mysql.git'
  cookbook 'w_nfs', git: 'https://github.com/haapp/w_nfs.git'
end
