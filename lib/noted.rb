require 'noted/version'
require 'noted/configuration'
require 'noted/cache'
require 'noted/search'
require 'noted/search/file_name'
require 'noted/search/full_text'

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
