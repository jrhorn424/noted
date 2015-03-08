require 'noted/cache'
require 'noted/configuration'
require 'noted/version'

module Noted
  extend self

  attr_accessor :configuration

  def configuration
    @configuration ||= Configuration.new
  end

  def reset
    @configuration = Configuration.new
  end

  def configure
    yield(configuration)
  end

  def cache
    @cache ||= Cache.new
  end

  def refresh_cache
    @cache = Cache.new
  end

  def root
    File.expand_path('../..', __FILE__)
  end

  def version
    VERSION
  end
end
