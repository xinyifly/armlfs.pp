Exec {
  environment => 'HOME=/root',
  path => [
    '/usr/local/sbin', '/usr/local/bin',
    '/usr/sbin', '/usr/bin',
    '/sbin', '/bin',
  ],
}

exec { 'upgrade':
  command => 'apt-get update && apt-get upgrade -y',
  schedule => daily,
}

Package {
  ensure => latest,
}
