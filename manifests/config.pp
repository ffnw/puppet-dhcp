class dhcp::config {

  include router

  concat { '/etc/radvd.conf':
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0644',
    ensure_newline => true,
  }

  concat::fragment { 'dhcp-header':
    target => '/etc/radvd.conf',
    source => 'puppet:///modules/dhcp/puppet-header',
    order  => '00',
  }

  file { '/etc/dnsmasq.d/dhcp-lease-max':
    ensure => present,
    source => 'puppet:///modules/dhcp/dhcp-lease-max',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}

