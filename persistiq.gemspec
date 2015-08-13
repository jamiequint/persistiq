# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "persistiq/version"
require "base64"

Gem::Specification.new do |s|
  s.name          = "persistiq"
  s.version       = Persistiq::VERSION
  s.authors       = ["Jamie Quint"]
  s.homepage      = "https://github.com/jamiequint/persistiq"
  s.summary       = %q{A Ruby wrapper for the PersistIQ API}
  s.description   = %q{A Ruby wrapper for the PersistIQ API}
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test)/})

  s.require_paths = ["lib"]

  s.add_runtime_dependency     'faraday'
  s.add_runtime_dependency     'faraday_middleware'
  s.add_runtime_dependency     'json'
  s.add_runtime_dependency     'hashie'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
