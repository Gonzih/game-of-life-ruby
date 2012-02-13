require 'bundler'
if defined?(Bundler)
  Bundler.require(:default, :test)
end

Dir[File.join(File.dirname(__FILE__),'../lib/**/*.rb')].each {|f| require f}
