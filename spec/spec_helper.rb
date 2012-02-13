require 'bundler'
Bundler.require(:default) if defined?(Bundler)
Dir[File.join(File.dirname(__FILE__),'../lib/**/*.rb')].each {|f| require f}
