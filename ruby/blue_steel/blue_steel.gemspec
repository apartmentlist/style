# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blue_steel/version"

Gem::Specification.new do |spec|
  spec.name          = "blue_steel"
  spec.version       = BlueSteel::VERSION
  spec.authors       = ["Cameron Irmas"]
  spec.email         = ["cirmas@apartmentlist.com"]

  spec.summary       = %q{Apartment List's internal coding style guide}
  spec.homepage      = "https://github.com/apartmentlist/style/tree/main/ruby/blue_steel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop-git", "~> 0.1.3"
  spec.add_dependency "rubocop-rails", "~> 2.9.1"
  spec.add_dependency "rubocop-rspec", "~> 2.2.0"
  spec.add_dependency "rubocop", "1.12.0"
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
end
