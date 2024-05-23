# -*- encoding: utf-8 -*-
# stub: country_state_select 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "country_state_select".freeze
  s.version = "3.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Arvind Vyas".freeze]
  s.date = "2023-01-08"
  s.description = "Country State Select is a Ruby Gem that aims to make Country and State/Province selection a cinch in Ruby on Rails environments.".freeze
  s.email = ["arvindvyas07@gmail.com".freeze]
  s.homepage = "https://github.com/arvindvyas/Country-State-Select".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Dynamically select Country and State.".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.3.3".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<city-state>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<rails>.freeze, [">= 0".freeze])
end
