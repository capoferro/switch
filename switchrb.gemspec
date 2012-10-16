# -*- encoding: utf-8 -*-
require File.expand_path('../lib/switch/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ["Josiah Kiehl"]
  s.email         = ["josiah@skirmisher.net"]
  s.description   = %q{Adds a switch statement to Ruby}
  s.summary       = s.description
  s.homepage      = "https://github.com/bluepojo/switch"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(spec|features)/})
  s.name          = "switchrb"
  s.require_paths = ["lib"]
  s.version       = Switch::VERSION
  s.required_ruby_version = ">= 1.9.1"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'guard', '>= 1.4.0'
  s.add_development_dependency 'guard-rspec', '>= 2.0.0'
  s.add_development_dependency 'guard-cucumber'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'guard-yard'
end
