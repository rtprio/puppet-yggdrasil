# class yggdrasil::install
#
class yggdrasil::install {

  package { 'yggdrasil':
    ensure => installed
  }

}