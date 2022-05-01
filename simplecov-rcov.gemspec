# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'simplecov-rcov/version'

Gem::Specification.new do |s|
  s.name        = %q{simplecov-rcov}
  s.version     = SimpleCov::Formatter::RcovFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fernando Guillen http://fernandoguillen.info", "Wes Morgan http://github.com/cap10morgan", "Wandenberg Peixoto http://github.com/wandenberg"]
  s.email       = ["fguillen.mail@gmail.com", "cap10morgan@gmail.com"]
  s.homepage    = "http://github.com/fguillen/simplecov-rcov"
  s.summary     = "Rcov style formatter for SimpleCov"
  s.description = "Rcov style formatter for SimpleCov"

  s.rubyforge_project = "simplecov-rcov"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'simplecov', '>= 0.4.1'
  
  s.add_development_dependency 'bundler', '>= 1.0.0.rc.6'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake', '>=12.3.3'
end
