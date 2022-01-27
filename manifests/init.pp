#
# @author Elliot Schlegelmilch
#
# @example
#   include yggdrasil
#
# @see https://yggdrasil-network.github.io/
#
# @param config_file
#   path to config file, hiera default
#
# @param adminlisten
#   Listen address for admin connections. Default is to listen
#   for local connections either on TCP/9001 or a UNIX socket
#   depending on your platform. To disable the admin socket, use
#   the value "none" instead.
#
# @param ifname
#   Local network interface name for TUN adapter, or `auto` to
#   select an interface automatically, or `none` to run without
#   TUN.
#
# @param ifmtu
#   Maximum Transmission Unit (MTU) size for your local TUN
#   interface.  Default is the largest supported size for your
#   platform. The lowest possible value is 1280.
#
# @param peers
#   List of connection strings for outbound peer connections in
#   URI format, e.g. `tls://a.b.c.d:e`. These connections will obey the
#   operating system routing table, therefore you should use this
#   section when you may connect via different interfaces.
#
# @param listen
#   Listen addresses for incoming connections. You will need to add
#   listeners in order to accept incoming peerings from non-local
#   nodes.  Multicast peer discovery will work regardless of any
#   listeners set here. Each listener should be specified in URI
#   format as above, e.g.  `tls://0.0.0.0:0` or `tls://[::]:0` to listen
#   on all interfaces.
#
# @param allowedpublickeys
#   List of peer public keys to allow incoming peering connections
#   from. If left empty/undefined then all connections will be
#   allowed by default. This does not affect outgoing peerings, nor
#   does it affect link-local peers discovered via multicast.
#
class yggdrasil(
  String $config_file,
  String $adminlisten,
  Optional[String] $ifname = '/dev/tun0',
  Optional[Integer] $ifmtu = 32767,
  Optional[Array[String]] $peers = [],
  Optional[Array[String]] $listen = [],
  Optional[Array[String]] $allowedpublickeys = [],
  Optional[Hash] $nodeinfo,
) {

  contain 'yggdrasil::install'
  contain 'yggdrasil::keys'
  contain 'yggdrasil::config'
  contain 'yggdrasil::service'

  Class['yggdrasil::install']
    ~> Class['yggdrasil::keys']
    ~> Class['yggdrasil::config']
    ~> Class['yggdrasil::service']


}