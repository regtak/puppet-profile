class profile::base_ex
(
  $ntp_servers
) {
  class {'::ntp':
    servers => $ntp_servers
  }
}
