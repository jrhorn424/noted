require 'noted/search/full_text'
require 'support/example_configuration'

describe Noted::Search::FullText do
  include_context 'example_configuration'

  it 'searches all files for matching content' do
    expect(Noted::Search::FullText.new('ba').matches).to eq [
      bar_dir + '/food.md',
      bar_dir + '/fruit.txt'
    ]
  end

  describe '#sort' do
    it 'sorts matches based on how frequently query appears in file' do
      expect(Noted::Search::FullText.new('ba').matches).to eq [
        bar_dir + '/fruit.txt',
        bar_dir + '/food.md'
      ]
    end
  end
end
