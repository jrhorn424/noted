require 'noted'

describe Noted do
  describe '#configuration' do
    it 'returns a configuration object' do
      expect(Noted.configuration).to be_a Noted::Configuration
    end

    it 'returns a singleton' do
      configuration = Noted.configuration
      expect(Noted.configuration).to be(configuration)
    end
  end

  describe '#reset' do
    it 'returns a configuration object' do
      expect(Noted.reset).to be_a Noted::Configuration
    end

    it 'returns a new configuration object' do
      configuration = Noted.configuration
      expect(Noted.reset).not_to be(configuration)
    end
  end

  describe '#configure' do
    it 'yields to a Configuration object' do
      Noted.configure do |config|
        config.path += ['/a/b/c']
      end

      expect(Noted.configuration.path.last).to eq('/a/b/c')
    end
  end

  describe '#root' do
    it 'returns the file path as a string' do
      expect(Noted.root).to be_a String
      expect(Noted.root).to match(/\/noted/)
    end
  end

  describe '#version' do
    it 'returns the version number as a String' do
      expect(Noted.version).to be_a String
      expect(Noted.version).to match(/\./)
    end
  end
end
