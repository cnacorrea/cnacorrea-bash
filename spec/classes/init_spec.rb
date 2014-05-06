#require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"
require 'spec_helper'

describe 'bash' do
	let(:title) { 'bash' }
	let(:node) { 'rspec.renanvicente.com' }
	let(:facts) do
	       	{ 
			:ipaddress => '10.10.20.20',
	       		:concat_basedir => '/var/lib/puppet/concat'
		}
	end

	describe 'Test standard configuration' do
	let(:facts) do
		{
			:concat_basedir => '/var/lib/puppet/concat'
		}
	end
		it do
		       	should contain_class('bash')
		end
	end
end
