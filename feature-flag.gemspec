# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feature/version'

Gem::Specification.new do |spec|
  spec.name          = "feature_flags"
  spec.version       = Feature::VERSION
  spec.authors       = ["thamilton-rsg"]
  spec.email         = ["thamilton@rsglab.com"]

  spec.summary       = %q{Enable/Disable interaction with page-object elements.}
  spec.description   = %q{This gem facilitates the need of enabling and disabling elements that need to be interacted with based on feature flags.}
  spec.homepage      = "https://github.com/thamilton-rsg/feature-flag.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.0'
  spec.add_development_dependency "simplecov"
end
