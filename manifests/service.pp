# @summary Control the yggdrasil service.
#
# @example
#   class { 'yggdrasil::service': ensure => stopped }
#
# @param [Variant[Boolean, Enum['true', 'false', 'running', 'stopped']]] yggdrasil_ensure
#     run or stop the yggdrasil service.
# @param [Boolean] yggdrasil_enable
#     enable or disable the service on startup.
#
# @author Elliot Schlegelmilch
#
class yggdrasil::service(
  Variant[Boolean, Enum['true', 'false', 'running', 'stopped']] $yggdrasil_ensure = 'running',
  Boolean $yggdrasil_enable = true,
) {

  service { 'yggdrasil':
    ensure => $yggdrasil_ensure,
    enable => $yggdrasil_enable,
  }

}