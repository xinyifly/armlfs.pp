node 'mysql.dev.docker' {

  file { '/var/lib/mysql':
    ensure => link,
    target => '/mnt/docker/mysql.dev',
  }

  class { 'mysql::server':
    service_provider => 'init',
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0',
      },
    },
    grants => {
      'root@%/*.*' => {
        ensure => 'present',
        options => ['GRANT'],
        privileges => ['ALL'],
        table => '*.*',
        user => 'root@%',
      },
    },
    restart => true,
    require => File['/var/lib/mysql'],
  }
}
