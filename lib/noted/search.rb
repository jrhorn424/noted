module Noted
  class Search
    attr_reader :results

    def initialize(query)
      @results = [Noted::Search::FileName, Noted::Search::FullText].map do |search|
        search.new(query).matches
      end.flatten
    end
  end
end
