#
class yggdrasil(
  String $config_file,
  Optional[Array[String]] $peers,
  Optional[Array[String]] $interfacepeers,
  Optional[Array[String]] $listen,
  String $adminlisten,
  Optional[Array[String]] $allowedpublickeys,
  Optional String $publickey,
  Optional String $privatekey,
  String $ifname,
  Integer $ifmtu,
) {

  contain 'yggdrasil::packages'
  contain 'yggdrasil::config'

  

}