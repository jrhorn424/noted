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
        File.open(file) { |f| f.any? { |line| line.include? query } }
      end
    end
  end
end
