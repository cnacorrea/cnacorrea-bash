#require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"
require 'spec_helper'

describe "bash", :type => :class  do
  let(:title) { 'bash' }
  let(:node) { 'rspec.renanvicente.com' }
  let :facts do
    { 
      :ipaddress => '10.10.30.30',
      :concat_basedir => '/specbash',
    }
  end
#  it { should contain_class("bash") }
end
