module Noted
  class Configuration
    attr_accessor :path

    def initialize
      @path = [ENV['HOME'] + 'notes']
    end
  end
end
