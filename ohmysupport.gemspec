require_relative "lib/ohmysupport/version"

Gem::Specification.new do |spec|
  spec.name        = "ohmysupport"
  spec.version     = Ohmysupport::VERSION
  spec.authors     = ["Stanislav Mekhonoshin"]
  spec.email       = ["ejabberd@gmail.com"]
  spec.homepage    = "https://github.com/ohmysecurity/ohmysupport"
  spec.summary     = "Summary of Ohmysupport."
  spec.description = "Description of Ohmysupport."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ohmysecurity/ohmysupport"
  spec.metadata["changelog_uri"] = "https://github.com/ohmysecurity/ohmysupport"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_dependency "aasm", "~> 5.2.0"
end
