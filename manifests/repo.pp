# @summary Creates packages repositories for supported systems.
#
# At present, there is only a debian repo.
# There is no yum repo at present, it will fail.
#
#
class yggdrasil::repo {

  if $facts['kernel'] == 'Linux' {
    if $facts['os']['family'] in ['Debian', 'Ubuntu'] {
      apt::source { 'neailalexandere':
        comment  => 'Debian repo for yggdrasil packages.',
        location => 'http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/',
        release  => 'debian',
        repos    => 'yggdrasil',
        key      => {
          'id'     => '569130E8CA20FBC4CB3FDE555898470A764B32C9',
          'source' => 'https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt',
        },
        include  => { 'deb' => true, },
      }
    }

    if $facts['os']['family'] in ['RedHat', 'CentOS'] {
      fail("no repo exists for '${facts['os']['family']}'.")
    }
  }
}