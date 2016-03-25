node 'apache.docker' {

  class { 'apache':
    service_enable => false,
    default_vhost => false,
  }

  apache::vhost { 'www.armlfs.org':
    port => '443',
    docroot => '/var/www/html',
    ssl => true,
    ssl_cert => '/mnt/docker/ssl/armlfs.org.crt',
    ssl_key => '/mnt/docker/ssl/armlfs.org.key',
    ssl_proxyengine => true,
    ssl_proxy_verify => 'none',
    ssl_proxy_check_peer_cn => 'off',
    ssl_proxy_check_peer_name => 'off',
    proxy_pass => [
      {
        'path' => '/',
        'url' => 'http://192.168.42.1:17443/',
      },
    ]
  }

  apache::vhost { 'zhao.armlfs.org':
    port => '80',
    docroot => '/var/www/html',
    proxy_pass => {
      'path' => '/',
      'url' => 'http://192.168.42.1:18001/',
    }
  }

  apache::vhost { 'amber.armlfs.org':
    port => '80',
    docroot => '/var/www/html',
    proxy_pass => {
      'path' => '/',
      'url' => 'http://192.168.42.1:18011/',
    }
  }

  apache::vhost { 'test.armlfs.org':
    port => '80',
    docroot => '/var/www/html',
    proxy_pass => {
      'path' => '/',
      'url' => 'http://192.168.42.1:17081/',
    }
  }
}
