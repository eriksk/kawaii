$:.push File.expand_path("../lib", __FILE__)
require 'kawaii/version'

Gem::Specification.new do |gem|  
  gem.version = Kawaii::VERSION

  gem.name = "kawaii"
  gem.date = %q[2012-07-11]
  gem.authors = ["Erik Skoglund"]
  gem.platform = Gem::Platform::RUBY
  gem.email = "erikskoglund88@gmail.com"
  gem.summary = "game library that extends gosu"
  gem.homepage = "https://github.com/eriksk/kawaii"
  gem.description = "kawaii provides a tiny game library that extends gosu"
  
  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  
  gem.default_executable = 'kawaii'
  
  gem.add_dependency('gosu', '>= 0.7.43')
  gem.add_dependency('chipmunk', '>= 5.3.4.5')
  gem.add_development_dependency('rspec')
end