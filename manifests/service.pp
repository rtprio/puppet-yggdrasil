# class yggdrasil::service
#
class yggdrasil::service(
  Variant[Boolean, Enum['true', 'false', 'running', 'stopped']] $yggdrasil_ensure = 'running',
  Boolean $yggdrasil_enable = true,
) {

  # service { 'yggdrasil':
  #   ensure => $yggdrasil::service::yggdrasil_running,
  #   enable => $yggdrasil::service::yggdrasil_enable,
  # }

}