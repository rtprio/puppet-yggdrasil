#
class yggdrasil::config {

  $yggvar = '/var/yggdrasil'
  file { "$yggvar": ensure => directory }

  exec { 'generate config':
    command => "yggdrasil -json -genconf > ${yggvar}/yggdrasil.generated.json",
    path    => "/usr/bin:/usr/local/bin",
    creates => "${yggvar}/yggdrasil.generated.json",
    user    => 0,
    group   => 0,
  }

  $json = loadjson("${yggvar}/yggdrasil.generated.json")
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