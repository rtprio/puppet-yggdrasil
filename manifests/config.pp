#
class yggdrasil::config {

  file { "/usr/local/etc/yggdrasil.conf": #yggdrasil::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => epp('yggdrasil/yggdrasil.conf.epp'),
  }

}