node 'apache.docker' {

  class { 'apache':
    service_enable => false,
    default_vhost => false,
  }

  apache::vhost { 'www.armlfs.org':
    port => '80',
    docroot => '/var/www/html',
    proxy_pass => {
      'path' => '/',
      'url' => 'http://192.168.42.1:17080/',
    }
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
