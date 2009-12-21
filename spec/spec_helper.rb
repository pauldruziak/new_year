require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'dm-core'
 
# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false
 
require File.join(File.dirname(__FILE__), '../lib', 'gift.rb') 

# establish in-memory database for testing
DataMapper.setup(:default, "sqlite3::memory:")
 
Spec::Runner.configure do |config|
  # reset database before each example is run
  config.before(:each) { DataMapper.auto_migrate! }
end
