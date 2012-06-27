Gem::Specification.new do |s|
  s.name = "kawaii"
  s.version = "0.0.1"
  s.authors = ["Erik Skoglund"]
  s.email = "erikskoglund88@gmail.com"
  s.summary = "kawaii provides a tiny game library that extends gosu"
  s.homepage = "https://github.com/eriksk/kawaii"
  s.description = "kawaii provides a tiny game library that extends gosu"
  s.files = ["README.md", "LICENSE", "kawaii/*kawaii.rb", "kawaii/content/content_manager.rb", "kawaii/entities/entity.rb", "kawaii/nodes/node.rb", "kawaii/nodes/node_manager.rb", "kawaii/utilities/vector2.rb"]
  s.add_dependency('gosu')
end