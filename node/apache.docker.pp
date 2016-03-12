node 'apache.docker' {
  class { 'apache':
    service_enable => false,
  }

  apache::vhost { 'www.armlfs.org':
    docroot => '/var/www/html',
    proxy_pass => {
      'path' => '/',
      'url' => 'http://192.168.42.1:17080',
    }
  }
}
