require 'noted/search/full_text'
require 'support/example_configuration'

describe Noted::Search::FullText do
  include_context 'example_configuration'

  describe '#perform' do
    it 'searches all files for matching content' do
      expect(Noted::Search::FullText.new('ba').matches).to eq [
        bar_dir + '/food.md'
      ]
    end
  end
end
