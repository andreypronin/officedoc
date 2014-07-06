# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'officedoc/version'

Gem::Specification.new do |spec|
  spec.name                   = "officedoc"
  spec.version                = Officedoc::VERSION
  spec.required_ruby_version  = '>= 2.1.0'
  spec.authors                = ["Andrey Pronin"]
  spec.email                  = ["moonfly.msk@gmail.com"]
  spec.summary                = %q{Parsing and constructing ODF and OOXML documents}
  spec.description            = %q{Parsing and constructing documents using XML-based Office formats: ODF and OOXML.}
  spec.homepage               = "https://github.com/moonfly/officedoc"
  spec.license                = "GPL-3"

  spec.files                  = `git ls-files -z`.split("\x0")
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths          = ["lib"]
  
  spec.add_runtime_dependency     "rubyzip", "~> 1.1"
  spec.add_runtime_dependency     "nokogiri", "~> 1.6"
  
  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "rake", "~> 10.2"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.3.0"
end
