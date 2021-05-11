# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "netsuite-adapter"
  spec.version       = "1.0.0"
  spec.authors       = ["Alex O"]
  spec.email         = ["alexandre.overtus@bus.com"]

  spec.summary       = %q{...}
  spec.description   = %q{..., but longer and more complete description}
  spec.homepage      = "https://github.com/"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/"
  spec.metadata["changelog_uri"] = "https://github.com/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 6.0"

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "database_cleaner-active_record"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "rubocop", ">= 0.88"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop-sorbet"
end
