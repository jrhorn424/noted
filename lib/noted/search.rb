module Noted
  module Search
    extend self

    def perform(query)
      (by_file_name(query).compact + by_full_text(query).compact).flatten
    end

    def by_file_name(query)
      Noted.cache.files.select do |file|
        File.fnmatch("#{query}*", file.split('/')[-1])
      end
    end

    def by_full_text(query)
      Noted.cache.files.select do |file|
        open(file) { |f| f.each_line.detect { |line| line.include? query } }
      end
    end

    def relevance(query, results)
      results.sort_by { |result| distance(query, result) }
    end

    def distance(string, other_string)
      require 'levenshtein-ffi'
      Levenshtein.distance(string, other_string)
    end
  end
end
