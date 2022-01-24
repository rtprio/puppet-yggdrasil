#
# @summary creates initial config file
#
# This will fail if the file exists and is not json.
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