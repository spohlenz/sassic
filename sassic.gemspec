Gem::Specification.new do |s|
  s.name = "sassic"
  s.version = "0.2"
  s.date = "2008-09-17"
  
  s.authors = [ "Sam Pohlenz" ]
  s.email = "sam@sampohlenz.com"
  s.homepage = "http://github.com/spohlenz/sassic"
  
  s.summary = "Simply Ruby web framework with SASS support"
  s.description = "Sassic is a simple framework for creating static web sites using SASS stylesheets."
  
  s.has_rdoc = false
  
  s.files = [ "README", 
		          "sassic.gemspec",
		          "lib/sassic/exec.rb",
		          "lib/sassic/files/index.html.erb",
		          "lib/sassic/files/layout.html.erb",
		          "lib/sassic/files/screen.sass",
		          "lib/sassic/generator.rb",
		          "lib/sassic/page.rb",
		          "lib/sassic/server.rb",
		          "lib/sassic/servlets/layout.rb",
		          "lib/sassic/servlets/sass.rb",
		          "lib/sassic/servlets.rb",
		          "lib/sassic/builder.rb",
		          "lib/sassic/tasks.rb",
		          "lib/sassic.rb",
		          "bin/sassic" ]
		
	s.executables = ['sassic']
  
  s.add_dependency("hpricot", ["> 0.6"])
  s.add_dependency("haml", ["> 2.0.0"])
end
