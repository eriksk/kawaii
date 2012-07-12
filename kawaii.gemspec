Gem::Specification.new do |s|
  s.name = "kawaii"
  s.date = %q[2012-07-11]
  s.authors = ["Erik Skoglund"]
  s.email = "erikskoglund88@gmail.com"
  s.summary = "game library that extends gosu"
  s.homepage = "https://github.com/eriksk/kawaii"
  s.description = "kawaii provides a tiny game library that extends gosu"
  s.files = Dir["README.md"] + Dir["LICENSE"] + Dir["lib/**/*.rb"] + Dir["lib/tasks/*.rake"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.default_executable = "hello"
  s.add_dependency('gosu') # TODO: version
  # TODO: chipmunk, version => ""

  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.version       = Kawaii::VERSION
end