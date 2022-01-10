#
class yggdrasil(
String $config_file,
String $adminlisten,
 ) inherits yggdrasil::params {

  # case $::osfamily {

  contain 'yggdrasil::packages'
  contain 'yggdrasil::config'

  

}