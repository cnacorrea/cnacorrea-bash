require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers


RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
  shell 'puppet module install puppetlabs/concat'
#    # Install module and dependencies
#    puppet_module_install(:source => proj_root, :module_name => 'cnacorrea-bash')
#    hosts.each do |host|
#      on host, puppet('module','install','puppetlabs-concat'), { :acceptable_exit_codes => [0,1] }
#    end
  end
end
