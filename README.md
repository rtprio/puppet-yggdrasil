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

Include usage examples for common use cases in the **Usage** section. Show your
users how to use your module to solve problems, and be sure to include code
examples. Include three to five examples of the most important or common tasks a
user can accomplish with your module. Show users how to accomplish more complex
tasks that involve different types, classes, and functions working in tandem.

## Reference

This section is deprecated. Instead, add reference information to your code as
Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your
module. For details on how to add code comments and generate documentation with
Strings, see the [Puppet Strings documentation][2] and [style guide][3].

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the
root of your module directory and list out each of your module's classes,
defined types, facts, functions, Puppet tasks, task plans, and resource types
and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

* The data type, if applicable.
* A description of what the element does.
* Valid values, if the data type doesn't make it obvious.
* Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other
warnings.

## Development

In the Development section, tell other users the ground rules for contributing
to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel are
necessary or important to include here. Please use the `##` header.

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
