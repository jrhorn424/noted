require 'noted/search'

describe Noted::Search do
  describe '#perform' do
    before(:all) do
      Noted.configure do |config|
        config.path = [
          File.expand_path('../../fixtures/foo_dir', __FILE__ ),
          File.expand_path('../../fixtures/bar_dir', __FILE__ )
        ]
      end
    end

    it 'searches note paths for matching files' do

    end
  end

  describe '#file_names' do
    it 'finds file names based on fuzzy matching'
  end

  describe '#full_text' do
    it 'finds matching files by querying contents'
  end

  describe '#relevance' do
    it 'orders results by Levenshtein distance and number of matches'
  end

  describe '#distance' do
    it 'computes Levenshtein distance'
  end
end
