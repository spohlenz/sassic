# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sassic}
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sam Pohlenz"]
  s.date = %q{2008-12-05}
  s.default_executable = %q{sassic}
  s.description = %q{Sassic is a simple framework for creating static web sites using SASS stylesheets.}
  s.email = %q{sam@sampohlenz.com}
  s.executables = ["sassic"]
  s.extra_rdoc_files = ["bin/sassic", "lib/sassic/builder.rb", "lib/sassic/exec.rb", "lib/sassic/files/index.html.erb", "lib/sassic/files/layout.html.erb", "lib/sassic/files/screen.sass", "lib/sassic/generator.rb", "lib/sassic/handlers/stylesheet.rb", "lib/sassic/handlers/template.rb", "lib/sassic/handlers.rb", "lib/sassic/page.rb", "lib/sassic/server.rb", "lib/sassic/tasks.rb", "lib/sassic.rb", "README"]
  s.files = ["bin/sassic", "lib/sassic/builder.rb", "lib/sassic/exec.rb", "lib/sassic/files/index.html.erb", "lib/sassic/files/layout.html.erb", "lib/sassic/files/screen.sass", "lib/sassic/generator.rb", "lib/sassic/handlers/stylesheet.rb", "lib/sassic/handlers/template.rb", "lib/sassic/handlers.rb", "lib/sassic/page.rb", "lib/sassic/server.rb", "lib/sassic/tasks.rb", "lib/sassic.rb", "Rakefile", "README", "sassic.gemspec", "Manifest"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/spohlenz/sassic}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Sassic", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sassic}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Sassic is a simple framework for creating static web sites using SASS stylesheets.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<mongrel>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<mongrel>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<mongrel>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
