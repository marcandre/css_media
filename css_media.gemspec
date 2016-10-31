# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'css_media/version'

Gem::Specification.new do |spec|
  spec.name          = "css_media"
  spec.version       = CssMedia::VERSION
  spec.authors       = ["Marc-Andre Lafortune"]
  spec.email         = ["github@marc-andre.ca"]

  spec.summary       = %q{Filter CSS to produce only @media rules}
  spec.description   = %q{Filter CSS to produce only @media rules}
  spec.homepage      = "http://github.com/marcandre/css_media"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "crass"
  spec.add_dependency "rails"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sass"
end
