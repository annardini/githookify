# frozen_string_literal: true

require_relative "lib/githookify/version"

Gem::Specification.new do |spec|
  spec.name = "githookify"
  spec.version = Githookify::VERSION
  spec.authors = ["Antonio Nardini"]
  spec.email = ["contact@antonionardini.com"]

  spec.summary = "Create and manage custom git hooks the ruby way."
  spec.homepage = "https://rubygems.org/gems/githookify"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/annardini/githookify"
  spec.metadata["changelog_uri"] = "https://github.com/annardini/githookify/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  
  spec.bindir = "bin"
  spec.executables = ["githookify"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.0"
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "colorize"
end
