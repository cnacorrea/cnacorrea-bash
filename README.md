# Puppet module: cnacorrea-bash

This module is meant to manage the bash shell environment.

It provides a sysadmin-friendly prompt, and can be used enforce system's default umask,

network proxy and idle session timeout. When applied to a host,

it will add a cnacorrea-bash.sh script to the /etc/profile.d directory with the desired settings.

A sample use would be:

    class { bash:
      umask         => '0022',
      network_proxy => 'proxy.cnacorrea.it:3128',
      timeout       => '900',
      color         => 'true'
      header        => '# puppet file. changes will be overwritten.\n# -- sysadmin\n',
    }

The custom prompt looks like this:

    [virtual/CentOS-6.4][admin@localhost]/etc(5)$

And it shows:
  - Whether the current system is virtual (if not, 'physical' is shown)
  - The current OS/release in use
  - Current user and hostname
  - Full path for the current directory
  - The command number for this session 

If color is set to true, the text is colored in a way that resembles PFSense's
system prompt.

Note that the customized bash-prompt may not display on Ubuntu systems because the
OS' ~/.bashrc overrides the PS1 env var. A simple way to solve this is to edit your
.bashrc (use something like 'nano ~/.bashrc') and comment lines as shown below.

    #if [ "$color_prompt" = yes ]; then
    #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #else
    #    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #fi
    #unset color_prompt force_color_prompt
    #
    # If this is an xterm set the title to user@host:dir
    #case "$TERM" in
    #xterm*|rxvt*)
    #    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #    ;;
    #*)
    #    ;;
    #esac

(these are lines 56-70 on an Ubuntu 12.04 system)


License
-------
Copyright (C) 2014 Carlos N. A. Correa

Carlos N. A. Correa can be contacted at: carlos.nilton@gmail.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contact
-------
Carlos N. A. Correa <carlos.nilton@gmail.com>

Renan Vicente Gomes da Silva <renanvice@gmail.com>

Support
-------
Please mail directly for any issues or questions.

Testing
-------
[![Build Status](https://travis-ci.org/cnacorrea/cnacorrea-bash.svg?branch=master)](https://travis-ci.org/cnacorrea/cnacorrea-bash.svg)
