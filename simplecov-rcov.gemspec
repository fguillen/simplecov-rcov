# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplecov-rcov}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fernando Guillen http://fernandoguillen.info", "Wes Morgan http://github.com/cap10morgan"]
  s.date = %q{2011-02-10}
  s.description = %q{Rcov style formatter for SimpleCov}
  s.email = ["fguillen.mail@gmail.com", "cap10morgan@gmail.com"]
  s.extra_rdoc_files = ["README.md", "lib/simplecov-rcov.rb"]
  s.files = ["Gemfile", "Gemfile.lock", "Manifest", "README.md", "Rakefile", "lib/simplecov-rcov.rb", "simplecov-rcov.gemspec", "test/fixtures/app/controllers/sample.rb", "test/fixtures/app/models/airplane.rb", "test/fixtures/app/models/dog.rb", "test/fixtures/app/models/house.rb", "test/fixtures/app/models/robot.rb", "test/fixtures/app/models/user.rb", "test/fixtures/file_tr.html", "test/fixtures/sample.rb", "test/fixtures/totals_tr.html", "test/helper.rb", "test/simplecov-rcov_test.rb", "views/index.erb.html"]
  s.homepage = %q{http://github.com/fguillen/simplecov-rcov}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simplecov-rcov", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{simplecov-rcov}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rcov style formatter for SimpleCov}
  s.test_files = ["test/simplecov-rcov_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
