#
class yggdrasil::config {
  contain yggdrasil::config::keys

  file { $yggdrasil::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => epp('yggdrasil/yggdrasil.conf.epp'),
  }

  Class['yggdrasil::config::keys'] -> File[$yggdrasil::config_file]
}