#
# class yggdrasil::config
# @private
#
class yggdrasil::config inherits yggdrasil {

  file { $::yggdrasil::config::config_file:
    ensure => present,
    owner  => 0,
    group  => 0,
    mode   => '0600',
  }

  Augeas {
    incl    => $::yggdrasil::config::config_file,
    lens    => 'json.lns',
    require => File[$::yggdrasil::config::config_file],
  }

  #
  # I thought there was a way to clear out a path without an explicit rm. e.g:
  # augeas { "allowedpublickeys clear":
  #   changes => [ "rm dict/entry[. = 'AllowedPublicKeys']/array/string[.]" ],
  # }

  $::yggdrasil::peers.each |$index, $value| {
    # list is 0 indexed, augeas is 1 indexed.
    $i = Integer.new($index) +1
    augeas { "Peers ${$value}":
      changes => [ "set dict/entry[. = 'Peers']/array/string[${i}] ${value}" ],
    }
  }

  $::yggdrasil::listen.each |$index, $value| {
    # list is 0 indexed, augeas is 1 indexed.
    $i = Integer.new($index) +1
    augeas { "Listen ${$value}":
      changes => [ "set dict/entry[. = 'Listen']/array/string[${i}] ${value}" ],
    }
  }

  augeas { 'adminlisten':
    changes => [
      "set dict/entry[. = 'AdminListen']/string ${::yggdrasil::adminlisten}",
    ],
  }

  $::yggdrasil::allowedpublickeys.each |$index, $value| {
  # list is 0 indexed, augeas is 1 indexed.
    $i = Integer.new($index) +1
    augeas { "AllowedPublickeys ${value}":
      changes => [ "set dict/entry[. = 'AllowedPublicKeys']/array/string[${i}] ${value}" ],
    }
  }

  # PublicKey
  # PrivateKey

  if !empty($::yggdrasil::ifname) {
    augeas { 'ifname':
      changes => [
        "set dict/entry[. = 'IfName']/string ${::yggdrasil::ifname}",
      ],
    }
  }

  if !empty("${::yggdrasil::ifmtu}") {
    augeas { 'ifmtu':
      changes => [
        "set dict/entry[. = 'IfMTU']/number ${::yggdrasil::ifmtu}",
      ],
    }
  }

  # TODO: read from hiera
  augeas { 'nodeinfo':
    changes => [
      "touch dict/entry[. = 'NodeInfo']/dict",
      "set dict/entry[. = 'NodeInfo']/dict/entry[1] fqdn",
      "set dict/entry[. = 'NodeInfo']/dict/entry[1]/string ${facts['networking']['fqdn']}",
    ],
  }
}
