require 'noted/search'
require 'support/example_configuration'

describe Noted::Search do
  include_context 'example_configuration'

  describe '#perform' do
    it 'searches note paths for matching files' do
    end

    it 'supports file globs' do
      expect(Noted::Search.perform('*')).to eq all_files
    end
  end

  describe '#by_file_name' do
    it 'finds file names based on fuzzy matching' do
      expect(Noted::Search.by_file_name('foo')).to eq [
        foo_dir + '/fool\'s errand.txt',
        bar_dir + '/food.md',
      ]
    end
  end

  describe '#by_full_text' do
    it 'finds matching files by querying contents' do
      expect(Noted::Search.by_full_text('ba')).to eq [
        bar_dir + '/food.md'
      ]
    end
  end

  describe '#relevance' do
    it 'orders results by Levenshtein distance and number of matches'
  end

  describe '#distance' do
    it 'computes Levenshtein distance'
  end
end
