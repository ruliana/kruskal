# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kruskal/version'

Gem::Specification.new do |spec|
  spec.name          = 'kruskal'
  spec.version       = Kruskal::VERSION
  spec.authors       = ['Ronie Uliana']
  spec.email         = ['ronie.uliana@gmail.com']
  spec.summary       = %q{Kruskal Minimum Spanning Tree algorithm}
  spec.description   = %q{Graph Minimum Spanning Tree implementation using a variation of Kruskal algorithm. Intended to be used directly from command line or as a lib.}
  spec.homepage      = 'http://github.com/ruliana/kruskal'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'json', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
end
