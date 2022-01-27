# yggdrasil

This module installs and configures the linux client for
Yggdrasil. Yggdrasil is an implementation of a routed end-to-end
encrypted IPv6 network.
[yggdrasil-network.github.io](yggdrasil-network.github.io) Node can be
connected with multicast on the same network. Nodes can also tcp or
tls connctions over existing ipv4 or ipv6 networks.

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with yggdrasil](#setup)
    * [What yggdrasil affects](#what-yggdrasil-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with yggdrasil](#beginning-with-yggdrasil)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Briefly tell users why they might want to use your module. Explain what your
module does and what kind of problems users can solve with it.

This should be a fairly short description helps the user decide if your module
is what they want.

## Setup

### What yggdrasil affects **OPTIONAL**

If the `yggdrasil::allowedpublickeys` is empty, any yggdrasil host can
connect, potentially joining your node to a larger network, or
exposing your network to unknown traffic.

If you advertise the routes for 300::/7, any host accepting this route will
gain access to your network.

### Setup Requirements **OPTIONAL**

This module requires stdlib and augeas.

### Beginning with yggdrasil

The easiest way to get started is to simply include the module.
The node will find other peers on the same network via multicast.
Nodes across wider networks can be linked with the listen and peers
directive.
```
include yggdrasil
```

This hiera lets hosts with two keys connect, and will try to establish
connections with two peers.

```
yggdrasil::listen:
  - tls://0.0.0.0:8827
yggdrasil::peers:
  - tls://11.11.22.7:18817
  - tls://192.168.200.11:10017
yggdrasil::allowedpublickeys:
  - 0000124fbc54ed7f4be2733b6f7676ef87e46bab9adccbbfe4f3d99c5a56a75e
  - 0012010278a0599e06bee81ec46ca44646bf2c30d5037b7d50ec81ae195cf546
```

## Usage

Another example is to add additional information to the node on the network:
```
yggdrasil::nodeinfo:
  hostname: "%{::fqdn}"
  puppetversion: "%{::puppetversion}"
  ipv4: "%{::networking.ip}"
```

## Reference

This module is documented with puppet strings.

## Limitations

The facts can not be loaded while the daemon is down or is still establishing
a connection. It's suggested to add a fair caching lifetime to these facts.
The ip address will remain the same as long as the key is not regenerated.

Advertising routes for the the `300/7` network or soliciting them is out of
scope of this module.

## Development

The github repo is mirrored from my personal repo.
Please file an issue on github if you discover anything.

