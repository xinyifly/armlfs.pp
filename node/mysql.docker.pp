node 'mysql.docker' {

  file { '/var/lib/mysql':
    ensure => link,
    target => '/mnt/docker/mysql',
  }

  class { 'mysql::server':
    service_provider => 'init',
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0',
      },
    },
    restart => true,
    require => File['/var/lib/mysql'],
  }
}
