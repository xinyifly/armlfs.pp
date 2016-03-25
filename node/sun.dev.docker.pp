node 'sun.dev.docker' {

  file { '/var/www/sun':
    ensure => link,
    target => '/mnt/docker/sun.dev',
  }

  class { 'apache':
    service_enable => false,
    default_vhost => false,
    require => File['/var/www/sun'],
  }

  apache::vhost { 'www.armlfs.org':
    port => '80',
    docroot => '/var/www/sun',
  }
}
