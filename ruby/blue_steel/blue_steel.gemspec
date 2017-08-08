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
  spec.homepage      = "https://github.com/apartmentlist/style/tree/master/ruby/blue_steel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop-git", "~> 0.1"
  spec.add_dependency "rubocop-rspec", "~> 1.15"
  spec.add_dependency "rubocop", "~> 0.36"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
