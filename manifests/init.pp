# == Class: bash
#
# Full description of class bash here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { bash:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class cnacorrea-bash (
  $umask = '0027',
  $network_proxy = '',
  $timeout = '600',
) {
  File {
    backup => false,
  }

  concat { 'cnacorrea-bash':
    path => '/etc/profile.d/cnacorrea-bash.sh',
  }

  file { '100-bash-umask.sh':
    path    => '/etc/profile.d/100-bash-umask.sh',
    ensure  => file,
    content => template('cnacorrea-bash/100-bash-umask.sh.erb'),
  }

  file { '100-bash-prompt.sh':
    path    => '/etc/profile.d/100-bash-prompt.sh',
    ensure  => file,
    content => template('cnacorrea-bash/100-bash-prompt.sh.erb'),
  }

  if ($network_proxy != '') {
    file { '100-bash-proxy.sh':
      path    => '/etc/profile.d/100-bash-proxy.sh',
      ensure  => file,
      content => template('cnacorrea-bash/100-bash-proxy.sh.erb'),
    }
  } else {
    file { '100-bash-proxy.sh':
      path   => '/etc/profile.d/100-bash-proxy.sh',
      ensure => absent,
    }
  }

  concat::fragment { 'bash_timeout':
    target  => 'cnacorrea-bash',
    content => template('cnacorrea-bash/100-bash-timeout.sh.erb'),
    order   => '400',
  }
}
