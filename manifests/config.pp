#
class yggdrasil::config(
  String $config_file = $::yggdrasil::config_file,
  Optional[String] $public_key = nul,
  Optional[String] $private_key = nul,
) inherits yggdrasil {

  $generated = loadjson("${puppet_vardir}/yggdrasil/yggdrasil.generated.json")
  $generated_public_key = $generated['PublicKey']
  $generated_private_key = $generated['PrivateKey']

  file { "${puppet_vardir}/yggdrasil/public.key":
    content => $generated_public_key,
    owner   => 0,
    group   => 0,
    mode    => '0600',
  }

  file { "${puppet_vardir}/yggdrasil/private.key":
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
