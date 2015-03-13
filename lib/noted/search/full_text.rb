module Noted
  class Search
    class FullText
      attr_reader :matches

      def initialize(query)
        @matches = Noted.cache.files.select do |file|
          open(file) { |f| f.each_line.detect { |line| line.include? query } }
        end
      end
    end
  end
end
