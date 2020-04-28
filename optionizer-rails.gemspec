
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "optionizer/rails/version"

Gem::Specification.new do |spec|
  spec.name          = 'optionizer-rails'
  spec.version       = Optionizer::Rails::VERSION
  spec.authors       = ['Kiryl Shreyter']
  spec.email         = ['kirylshreyter@gmail.com']

  spec.summary       = %q{Presents hashes visual.}
  spec.description   = %q{Manage your hashes with visual editor.}
  spec.homepage      = "https://github.com/kirylshreyter/optionizer-rails"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/kirylshreyter/optionizer-rails"
    spec.metadata["changelog_uri"] = "https://github.com/kirylshreyter/optionizer-rails/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'actionmailer'
  spec.add_development_dependency 'activestorage'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sprockets-rails'
  spec.add_development_dependency 'sqlite3'

  spec.add_dependency 'actionview'
  spec.add_dependency 'activemodel'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'browserify-rails'
  spec.add_dependency 'react-rails'
end
