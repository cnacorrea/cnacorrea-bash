#require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"
require 'spec_helper'

describe 'bash' do
	let(:title) { 'bash' }
	let(:node) { 'rspec.renanvicente.com' }
	let(:facts) { { :ipaddress => '10.10.20.20' } }

	describe 'Test standard configuration' do
		should contain_concat__fragment('cnacorrea-bash_header').with( 'target' => '/etc/profile.d/cnacorrea-bash.sh' )
		it { should contain_class('bash') }
	end
end
