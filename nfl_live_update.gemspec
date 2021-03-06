$:.push File.expand_path("../lib", __FILE__)
require "nfl/live_update/version"

Gem::Specification.new do |s|
  s.name        = "nfl_live_update"
  s.version     = NFL::LiveUpdate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon Karna"]
  s.email       = ["ipg49vv2@gmail.com"]
  s.homepage    = "https://github.com/jonkarna/nfl_live_update"
  s.summary     = %q{A simple Ruby framework for building REST-like APIs.}
  s.description = %q{A Ruby framework for rapid API development with great conventions.}

  s.rubyforge_project = "nfl_live_update"

  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "i18n"
  s.add_runtime_dependency "activesupport", "3.1.3"

  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "bundler"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "mocha"
  s.add_development_dependency "turn"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
