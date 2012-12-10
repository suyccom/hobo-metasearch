# HoboMetasearch
# Sub dependencies written in the gemspec are not loaded by default:
#   http://stackoverflow.com/questions/6960078
require 'ransack'

module HoboMetasearch

  VERSION = File.read(File.expand_path('../../VERSION', __FILE__)).strip
  @@root = Pathname.new File.expand_path('../..', __FILE__)
  def self.root; @@root; end

  require 'hobo-metasearch/railtie' if defined?(Rails)

  class Engine < ::Rails::Engine
  end
end
