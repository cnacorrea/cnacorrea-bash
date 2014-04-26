require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers


RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Configure all nodes in nodeset
  c.before :suite do
    puppet_module_install(:source => proj_root + '/spec/fixtures/modules/concat', :module_name => 'concat')
    shell 'puppet module install puppetlabs/concat'
  end
end
