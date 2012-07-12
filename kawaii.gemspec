Gem::Specification.new do |s|
  s.version = Kawaii::VERSION
  s.name = "kawaii"
  s.date = %q[2012-07-11]
  s.authors = ["Erik Skoglund"]
  s.email = "erikskoglund88@gmail.com"
  s.summary = "game library that extends gosu"
  s.homepage = "https://github.com/eriksk/kawaii"
  s.description = "kawaii provides a tiny game library that extends gosu"
  s.files = `git ls-files`.split($\)
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.default_executable = "hello"
  s.add_dependency('gosu', '>= 0.7.43')
  s.add_dependency('chipmunk', '>= 5.3.4.5')
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end