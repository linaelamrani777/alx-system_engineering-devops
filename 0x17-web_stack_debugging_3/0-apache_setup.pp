# 0-apache_setup.pp

# Ensure Apache is installed
package { 'apache2':
  ensure => installed,
}

# Ensure Apache service is running
service { 'apache2':
  ensure => running,
  enable => true,
}

# Ensure the main Apache configuration file is present
file { '/etc/apache2/apache2.conf':
  ensure  => file,
  source  => 'puppet:///modules/apache/apache2.conf',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['apache2'], # Restart Apache if this file changes
}

# Ensure correct directory permissions for web root
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,
}
