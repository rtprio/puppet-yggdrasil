# class yggdrasil::repo
#
class yggdrasil::repo {
  
  case $facts['os']['family']  {
    'Debian', 'Ubuntu': {
      apt::source { 'neailalexandere':
      comment  => 'Debian repo for yydrasil packages.',
      location => 'http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/',
      release  => 'debian',
      repos    => 'yggdrasil',
      key      => {
        'id'     => '569130E8CA20FBC4CB3FDE555898470A764B32C9',
        'source' => 'https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt',
      },
      include  => {
        'deb' => true,
      },
    }
    }
    
    
    'RedHat', 'CentOS':  {
       err("repo support not implemented yet")
    }
  }

}