require 'noted'

shared_context 'example_configuration' do
  before(:all) do
    Noted.configure do |config|
      config.path = [foo_dir, bar_dir]
    end
  end

  def all_files
    [
      foo_dir + '/fool\'s errand.txt',
      foo_dir + '/wishlist.md',
      bar_dir + '/food.md'
    ]
  end

  def foo_dir
    File.expand_path('../../fixtures/foo_dir', __FILE__)
  end

  def bar_dir
    File.expand_path('../../fixtures/bar_dir', __FILE__)
  end
end
