#
class yggdrasil::keys {

  exec { 'generate config':
    command => 'yggdrasil -json -genconf > /usr/local/etc/yggdrasil.conf',
    path    => '/usr/bin:/usr/local/bin',
    creates => '/usr/local/etc/yggdrasil.conf',
    user    => 0,
    group   => 0,
  }

}