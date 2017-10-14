class profile::base(
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ],
  $ntp_service_enable = 'True'
) {
  include ::ssh
  class {'::ntp': 
    servers => $ntp_servers,
    serivce_enable => $ntp_service_enable
  }
  
  if $facts['os']['family'] == 'RedHat' {
    include ::selinux
  }
}
