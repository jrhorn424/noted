require 'noted/configuration'

describe Noted::Configuration do
  describe '.path' do
    it 'is a collection of strings representing file paths' do
      expect(Noted::Configuration.new.path).to be_an Array
    end

    it 'defaults to $HOME/notes' do
      expect(Noted::Configuration.new.path).to eq [ENV['HOME'] + 'notes']
    end
  end
end
