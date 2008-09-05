class Sassic::Generator
  FOLDERS = ['images', 'stylesheets', 'javascripts', 'templates']
  FILES = {
    'layout.html.erb' => 'templates/layout.html.erb'
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
    FOLDERS.each { |f| create_directory(File.join(target, f)) }
  end
  
  def create_files!
    FILES.each do |src, dest|
      FileUtils.cp File.join(File.dirname(__FILE__), 'files', src), File.join(target, dest)
      puts "Created file #{dest}"
    end
  end
  
  def create_directory(f)
    FileUtils.mkdir_p(f)
    puts "Created directory #{f}"
  end
end
