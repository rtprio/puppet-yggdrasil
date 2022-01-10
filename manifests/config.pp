#
class yggdrasil::config {

  exec { 'generate config':
    command => "yggdrasil -json -genconf > $vardir/yggdrasil.generated.json",
    path    => "/usr/bin:/usr/local/bin",
    creates => "$vardir/yggdrasil.generated.json",
    user    => 0,
    group   => 0,
  }

  file { $yggdrasil::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => epp('yggdrasil/yggdrasil.conf.epp'),
  }

}