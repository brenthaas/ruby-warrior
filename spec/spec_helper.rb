require 'rubygems'
require 'rspec'
require File.dirname(__FILE__) + '/../lib/ruby_warrior'

RSpec.configure do |config|
  config.before(:each) do
    RubyWarrior::Config.reset
  end
end
