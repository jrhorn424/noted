require 'noted'
require 'support/example_configuration'

describe Noted::Cache do
  include_context 'example_configuration'

  it 'persists a cache to $HOME/.noted/cache'

  describe '#files' do
    it 'is an array' do
      expect(Noted::Cache.new.files).to be_an Array
    end

    it 'is a list of files based on the note search path' do
      expect(Noted::Cache.new.files).to eq all_files
    end
  end
end
