
Gem::Specification.new do |spec|
  spec.name          = "protos"
  spec.version       = "1.0.0"
  spec.authors       = ["François Beausoleil"]
  spec.email         = ["dev@bus.com"]

  spec.summary       = %q{...}
  spec.description   = %q{..., but longer and more complete description}
  spec.homepage      = "https://github.com/"
  spec.license       = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = spec.homepage
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

  spec.add_dependency "activemodel", ">= 5.2.2"
  spec.add_dependency "google-protobuf", "~> 3.15.8"

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rspec", "~> 3.10.0"
  spec.add_development_dependency "pry-byebug"
end
