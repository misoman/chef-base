# -*- mode: ruby -*-
# vi: set ft=ruby :
Encoding.default_external = "UTF-8"
source 'https://supermarket.chef.io'

cookbook 'ubuntu'
cookbook 'apt'
cookbook 'apt-repo', git: 'https://github.com/sometimesfood/chef-apt-repo.git'
cookbook 'git'
cookbook 'monit', git: 'https://github.com/phlipper/chef-monit.git'
cookbook 'firewall', "~> 1.4.0"
cookbook 'ntp'
cookbook 'sudo'
cookbook 'timezone-ii'
cookbook 'vmware-tools', git: 'https://github.com/tamucookbooks/vmware-tools.git'
cookbook 'windows', git: 'https://github.com/opscode-cookbooks/windows.git', ref: '0e5d9338b75ac3c56112788b0f111c4d2bed3d9a'

cookbook 'haproxy', git: 'https://github.com/fulloflilies/haproxy.git', ref: '27a1e4646c2a83bb94be3b7b32cd4865f28b010f'
cookbook 'keepalived'
cookbook 'varnish'
cookbook 's3_file'
cookbook 'apache2', git: 'https://github.com/svanzoest-cookbooks/apache2.git', ref: '4ac713294d21c7f9f800bf9b64859ecba29f1552'
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
  cookbook 'w_common', git: 'https://github.com/haapp/w_common.git'
  cookbook 'w_haproxy', git: 'https://github.com/haapp/w_haproxy.git'
  cookbook 'w_varnish', git: 'https://github.com/haapp/w_varnish.git'
  cookbook 'w_apache', git: 'https://github.com/haapp/w_apache.git'
  cookbook 'w_memcached', git: 'https://github.com/haapp/w_memcached.git'
  cookbook 'w_percona', git: 'https://github.com/haapp/w_percona.git'
  cookbook 'w_mysql', git: 'https://github.com/haapp/w_mysql.git'
  cookbook 'w_nfs', git: 'https://github.com/haapp/w_nfs.git'
end
