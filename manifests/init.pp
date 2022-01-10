#
class yggdrasil(
  String $config_file,
  String $adminlisten,
  Optional[String] $ifname,
  Optional[Integer] $ifmtu,
  Optional[Array[String]] $peers,
  Optional[Array[String]] $interfacepeers,
  Optional[Array[String]] $listen,
  Optional[Array[String]] $allowedpublickeys,
  Optional[String] $publickey,
  Optional[String] $privatekey,
) {

  contain 'yggdrasil::packages'
  contain 'yggdrasil::config'
  contain 'yggdrasil::service'
}