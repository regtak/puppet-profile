class profile::apache1 (
  Boolean $default_vhost = false,
  Integer $port_number = 80,
  String $docroot = "/var/www/${facts['fqdn']}",
  String $vhost_name = "${facts['fqdn']}",
  String $index_content = 'Test page. This is a test',
) {
  class { '::apache' :
    default_vhost => $default_vhost,
  }
  ::apache::vhost { $vhost_name :
    port    => $port_number,
    docroot => $docroot,
  }
  file {'index.html':
    ensure => file,
    path => "$docroot/index.html",
    content => $index_content,
  }
}
