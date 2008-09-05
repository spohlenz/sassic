class Sassic::Generator
  DIRECTORIES = ['images', 'sass', 'javascripts', 'templates']
  
  FILES = {
    'layout.html.erb' => 'templates/layout.html.erb',
    'index.html.erb'  => 'templates/index.html.erb',
    'screen.sass'     => 'sass/screen.sass'
  }
  
  attr_reader :target
  
  def initialize(target)
    @target = target
  end
  
  def run!
    create_directories!
    create_files!
  end

private
  def create_directories!
    create_directory(target)
    DIRECTORIES.each { |d| create_directory(File.join(target, d)) }
  end
  
  def create_files!
    FILES.each do |src, dest|
      create_file(File.join(File.dirname(__FILE__), 'files', src), File.join(target, dest))
    end
  end
  
  def create_directory(d)
    FileUtils.mkdir_p(d)
    puts "Created directory #{d}"
  end
  
  def create_file(src, dest)
    FileUtils.cp src, dest
    puts "Created file #{dest}"
  end
end
