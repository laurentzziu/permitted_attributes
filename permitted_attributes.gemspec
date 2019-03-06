# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'permitted_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = 'permitted_attributes'
  spec.version       = PermittedAttributes::VERSION
  spec.authors       = ['Florin Gorgan']
  spec.email         = ['florin@floringorgan.com']

  spec.summary       = 'Easily generate permitted attributes for ActiveController::StrongParameters'
  spec.description   = 'Gem to easily generate permitted attributes for ActiveController::StrongParameters'
  spec.homepage      = 'https://github.com/laurentzziu/permitted_attributes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-console'
end
