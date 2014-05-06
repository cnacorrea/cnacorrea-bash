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
