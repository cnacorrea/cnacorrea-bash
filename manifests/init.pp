# == Class: bash
#
# This class is meant to manage the bash shell environment. It provides a
# sysadmin-friendly prompt, and can be used enforce system's default umask, network proxy
# and idle session timeout. When applied to a host, it will add a cnacorrea-bash.sh script
# to the /etc/profile.d directory with the desired settings.
#
# === Parameters
#
# [*umask*]
#   Sets system's default umask. Default: 0027
# [*network_proxy*]
#   If non-empty, sets network proxy to be used. The expected format is either fqdn:port
#   or ipaddress:port. It is assumed that the proxy server is able to provide HTTP/S and
#   FTP proxying, so environment vars for the 3 protocols are set (http_proxy, https_proxy
#   and ftp_proxy). Default: empty
# [*timeout*]
#   Time (seconds) idle sessions will wait before auto-logoff. Default: 600
# [*header*]
#   String containing the header for the generated profile script, maybe warning fellow
#   sysadmins that the file is being managed by Puppet. A simple comment is set as
#   default. 
#
# === Examples
#
#  class { bash:
#    umask         => '0022',
#    network_proxy => 'proxy.cnacorrea.it:3128',
#    timeout       => '900',
#    header        => '# puppet file. changes will be overwritten.\n# -- sysadmin\n',
#  }
#
# === Authors
#
# Carlos N. A. Correa <carlos.nilton@gmail.com>
#
# === Copyright
#
# Copyright 2014 Carlos N. A. Correa.
#
class bash (
  $umask         = '0027',
  $network_proxy = '',
  $timeout       = '600',
  $header        = "# puppet-provisioned file. local edits are going to be lost!\n#\n",
) {
  File {
    backup => false,
  }

  concat { 'cnacorrea-bash_file':
    path => '/etc/profile.d/cnacorrea-bash.sh',
  }

  concat::fragment { 'cnacorrea-bash_header':
    target  => 'cnacorrea-bash_file',
    content => $header,
    order   => '001',
  }
    
  concat::fragment { 'cnacorrea-bash_prompt':
    target  => 'cnacorrea-bash_file',
    content => template('bash/100-bash-prompt.sh.erb'),
    order   => '100',
  }
  
  concat::fragment { 'cnacorrea-bash_umask':
    target  => 'cnacorrea-bash_file',
    content => template('bash/200-bash-umask.sh.erb'),
    order   => '200',
  }

  if ($network_proxy != '') {
    concat::fragment { 'cnacorrea-bash_proxy.sh':
      target  => 'cnacorrea-bash_file',
      content => template('bash/300-bash-proxy.sh.erb'),
      order   => '300',
    }
  }

  concat::fragment { 'cnacorrea-bash_timeout':
    target  => 'cnacorrea-bash_file',
    content => template('bash/400-bash-timeout.sh.erb'),
    order   => '400',
  }
}
