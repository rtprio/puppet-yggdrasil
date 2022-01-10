node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'yggdrasil':
    require => Notify['enduser-before'],
    before  => Notify['enduser-after'],
  }

}
