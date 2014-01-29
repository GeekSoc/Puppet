require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.manifest = File.join(fixture_path, 'site.pp')
  c.module_path = './modules'
  c.manifest_dir = './manifests'
end
