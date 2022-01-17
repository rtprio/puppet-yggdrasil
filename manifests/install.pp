# class yggdrasil::install
#
class yggdrasil::install {

  include '::yggdrasil::repo'

  package { 'yggdrasil':
    ensure => installed
  }

  Class['::yggdrasil::repo'] -> Package['yggdrasil']

}