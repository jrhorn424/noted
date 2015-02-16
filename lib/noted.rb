require "noted/version"

module Noted
  extend self

  def root
    File.expand_path('../..', __FILE__)
  end
end
