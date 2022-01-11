#
class yggdrasil::keys {

  file { "${puppet_vardir}/yggdrasil":
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0700',
  }

  exec { 'generate keys':
    command     => "yggdrasil -json -genconf > ${puppet_vardir}/yggdrasil/yggdrasil.generated.json",
    path        => '/usr/bin:/usr/local/bin',
    creates     => "${puppet_vardir}/yggdrasil/yggdrasil.generated.json",
    user        => 0,
    group       => 0,
  }

}