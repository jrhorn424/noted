require 'noted/search/file_name'
require 'support/example_configuration'

describe Noted::Search::FileName do
  include_context 'example_configuration'

  it 'searches for file names matching the query' do
    expect(Noted::Search::FileName.new('foo').matches).to eq [
      foo_dir + '/fool\'s errand.txt',
      bar_dir + '/food.md'
    ]
  end

  describe '#sort' do
    it 'sorts matches by filename edit distance' do
      expect(Noted::Search::FileName.new('foo').matches.sort).to eq [
        bar_dir + '/food.md',
        foo_dir + '/fool\'s errand.txt'
      ]
    end
  end
end
