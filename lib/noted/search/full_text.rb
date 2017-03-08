module Noted
  class Search
    class FullText
      attr_reader :matches

      def initialize(query)
        @query = query

        @matches = Noted.cache.files.select do |file|
          open(file) { |f| f.each_line.detect { |line| line.include? @query } }
        end
      end

      def sort
        sort_by { |match| number_of_matches(match) }
      end

    private

      def number_of_matches(file)
        open(file) do |f|
          f.each_line.map { |line| line.scan(Regexp.new(@query[0..-1])).length }
        end.inject(:+)
      end
    end
  end
end
