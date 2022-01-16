# class yggdrasil::service
#
# @param [Variant[Boolean, Enum['true', 'false', 'running', 'stopped']]] yggdrasil_ensure
#     run or stop the yggdrasil service.
# @param [Boolean] yggdrasil_enable
#     enable or disable the service on startup.
#
class yggdrasil::service(
  Variant[Boolean, Enum['true', 'false', 'running', 'stopped']] $yggdrasil_ensure = 'running',
  Boolean $yggdrasil_enable = true,
) {

  service { 'yggdrasil':
    ensure => $yggdrasil::service::yggdrasil_running,
    enable => $yggdrasil::service::yggdrasil_enable,
  }

}