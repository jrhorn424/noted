require 'noted/search'
require 'support/example_configuration'

describe Noted::Search do
  include_context 'example_configuration'

  it 'searches note paths for matching files' do
  end

  it 'supports file globs' do
    expect(Noted::Search.new('*').results).to eq all_files
  end
end
