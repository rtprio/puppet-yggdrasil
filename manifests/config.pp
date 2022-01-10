#
class yggdrasil::config {

  exec { 'generate config':
    command => "yggdrasil -json -genconf > ${vardir}/yggdrasil.generated.json",
    path    => "/usr/bin:/usr/local/bin",
    creates => "$vardir/yggdrasil.generated.json",
    user    => 0,
    group   => 0,
  }

  $json = loadjson("${vardir}/yggdrasil.generated.json")
  $generated_public_key = $json['PublicKey']
  $generated_private_key = $json['PrivateKey']

  file { $yggdrasil::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => epp('yggdrasil/yggdrasil.conf.epp'),
  }

}