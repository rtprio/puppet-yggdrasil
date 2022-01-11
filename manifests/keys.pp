#
class yggdrasil::keys (
  $tmp = $yggdrasil::tmp
) inherits yggdrasil {

  file { $yggdrasil::tmp: ensure => directory }

  exec { 'generate keys':
    command     => "yggdrasil -json -genconf > ${yggdrasil::tmp}/yggdrasil.generated.json",
    path        => '/usr/bin:/usr/local/bin',
    creates     => "${yggdrasil::tmp}/yggdrasil.generated.json",
    user        => 0,
    group       => 0,
  }

}