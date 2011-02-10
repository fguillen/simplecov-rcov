# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplecov-rcov}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fernando Guillen http://fernandoguillen.info"]
  s.date = %q{2011-02-10}
  s.description = %q{Rcov style formatter for SimpleCov}
  s.email = %q{fguillen.mail@gmail.com}
  s.extra_rdoc_files = ["README.md", "lib/simplecov-rcov.rb"]
  s.files = ["Manifest", "README.md", "Rakefile", "lib/simplecov-rcov.rb", "test/fixtures/app/controllers/sample_controller.rb", "test/fixtures/app/models/user.rb", "test/fixtures/file_tr.html", "test/fixtures/index_created.html", "test/fixtures/index_rcov.html", "test/fixtures/sample.rb", "test/fixtures/totals_tr.html", "test/helper.rb", "test/simplecov-rcov_test.rb", "views/index.erb.html", "simplecov-rcov.gemspec"]
  s.homepage = %q{http://github.com/fguillen/simplecov-rcov}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Simplecov-rcov", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{simplecov-rcov}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Rcov style formatter for SimpleCov}
  s.test_files = ["test/simplecov-rcov_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
