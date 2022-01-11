#
class yggdrasil::config(
  String $config_file = $::yggdrasil::config_file,
  Optional[String] $public_key = nul,
  Optional[String] $private_key = nul,
) inherits yggdrasil {

  $json = loadjson("${yggdrasil::tmp}/yggdrasil.generated.json")
  $generated_public_key = $json['PublicKey']
  $generated_private_key = $json['PrivateKey']

  file { "${puppet_vardir}/public.key":
    content => $generated_public_key,
    owner   => 0,
    group   => 0,
    mode    => '0600',
  }

  file { "${puppet_vardir}/private.key":
    content => $generated_private_key,
    owner   => 0,
    group   => 0,
    mode    => '0600',
  }

  file { $::yggdrasil::config::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => epp('yggdrasil/yggdrasil.conf.epp'),
  }

}