class profile::base(
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ],
  Boolean $ntp_service_hasstatus = true,
  Boolean $ntp_service_enable = true
) {
  include ::ssh
  class {'::ntp': 
    servers => $ntp_servers,
    service_enable => $ntp_service_enable,
  }
  
  if $facts['os']['family'] == 'RedHat' {
    include ::selinux
  }
}
