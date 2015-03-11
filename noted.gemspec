# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noted/version'

Gem::Specification.new do |spec|
  spec.name          = 'noted'
  spec.version       = Noted::VERSION
  spec.authors       = ['Jeffrey Horn']
  spec.email         = ['jeffh@generalassemb.ly']
  spec.summary       = %q{Fuzzy notes in your terminal.}
  spec.description   = %q{Noted is an nvAlt and todo.txt inspired note-taking
                          tool.}
  spec.homepage      = 'https://github.com/jrhorn424/noted'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'levenshtein-ffi', '~> 1.1.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'byebug', '~> 3.5.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.5.0'
end
