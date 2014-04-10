# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'officedoc/version'

Gem::Specification.new do |spec|
  spec.name          = "officedoc"
  spec.version       = Officedoc::VERSION
  spec.authors       = ["Andrey Pronin"]
  spec.email         = ["moonfly.msk@gmail.com"]
  spec.summary       = %q{Parsing and constructing ODF and OOXML documents}
  spec.description   = %q{Parsing and constructing documents using XML-based Office formats: ODF and OOXML.}
  spec.homepage      = "https://github.com/moonfly/officedoc"
  spec.license       = "GPL-3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta2"
end
