Gem::Specification.new do |s|
  s.name = "sassic"
  s.version = "0.1"
  s.date = "2008-09-04"
  
  s.authors = [ "Sam Pohlenz" ]
  s.email = "sam@sampohlenz.com"
  s.homepage = "http://github.com/spohlenz/sassic"
  
  s.summary = "Simply Ruby web framework with SASS support"
  s.description = "Sassic is a simple framework for creating static web sites using SASS stylesheets."
  
  s.has_rdoc = false
  
  s.files = [ "README", 
		          "sassic.gemspec", 
		          "lib/sassic/generator.rb", 
		          "lib/sassic/server.rb", 
		          "lib/sassic.rb",
		          "bin/sassic" ]
		
	s.executables = ['sassic']
  
  #s.add_dependency("diff-lcs", ["> 0.0.0"])
  #s.add_dependency("mime-types", ["> 0.0.0"])
  #s.add_dependency("open4", ["> 0.0.0"])
end
