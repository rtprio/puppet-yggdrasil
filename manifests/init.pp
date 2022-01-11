#
class yggdrasil(
  String $config_file,
  String $adminlisten,
  String $tmp,
  Optional[String] $ifname = '/dev/tun0',
  Optional[Integer] $ifmtu = 32767,
  Optional[Array[String]] $peers = [],
  Optional[Array[String]] $interfacepeers = [],
  Optional[Array[String]] $listen = [],
  Optional[Array[String]] $allowedpublickeys = [],
  Optional[String] $public_key = nul,
  Optional[String] $private_key = nul,
) {

  contain 'yggdrasil::install'
  contain 'yggdrasil::keys'
  contain 'yggdrasil::config'
  contain 'yggdrasil::service'

  Class['yggdrasil::install']
    -> Class['yggdrasil::keys']
    -> Class['yggdrasil::config']
    -> Class['yggdrasil::service']


}