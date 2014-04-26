#require 'spec_helper'
require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe "bash" do
  it { should create_class('bash')}
end
