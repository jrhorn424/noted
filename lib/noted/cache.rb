module Noted
  class Cache
    attr_reader :files

    def initialize
      @files = Noted.configuration.path.map do |directory|
        Dir.glob("#{directory}/**/*")
      end.flatten
    end
  end
end
