
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "relay"
  spec.version       = "1.0.0"
  spec.authors       = ["François Beausoleil"]
  spec.email         = ["francois@teksol.info"]

  spec.summary       = %q{...}
  spec.description   = %q{..., but longer and more complete description}
  spec.homepage      = "https://github.com/"
  spec.license       = "Private"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/"

    spec.metadata["homepage_uri"]    = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/"
    spec.metadata["changelog_uri"]   = "https://github.com/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.glob("lib/**/*")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel",   ">= 5.2.2.1"
  spec.add_dependency "activesupport", ">= 5.2.2.1"
  spec.add_dependency "bunny",         ">= 2.14.3"
  spec.add_dependency "metrics",       ">= 1.0.0"
  spec.add_dependency "protos",       ">= 1.0.0"

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "< 4"
end
