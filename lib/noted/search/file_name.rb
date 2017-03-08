module Noted
  class Search
    class FileName
      attr_reader :matches

      def initialize(query)
        @matches = Noted.cache.files.select do |file|
          File.fnmatch("#{query}*", file.split('/')[-1])
        end
      end

      def sort
        sort_by { |match| edit_distance(@query, match) }
      end

    private

      def edit_distance(string, other_string)
        require 'levenshtein-ffi'
        Levenshtein.distance(string, other_string)
      end
    end
  end
end
