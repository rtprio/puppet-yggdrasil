#
class yggdrasil(
  String $config_file,
  String $adminlisten,
  Optional[String] $ifname = '/dev/tun0',
  Optional[Integer] $ifmtu = 32767,
  Optional[Array[String]] $peers = [],
  Optional[Array[String]] $interfacepeers = [],
  Optional[Array[String]] $listen = [],
  Optional[Array[String]] $allowedpublickeys = [],
  Optional[String] $publickey = nul,
  Optional[String] $privatekey = nul,
) {

  contain 'yggdrasil::install'
  contain 'yggdrasil::config'
  contain 'yggdrasil::service'

  Class['yggdrasil::install']
    -> Class['yggdrasil::config']
    -> Class['yggdrasil::service']
}