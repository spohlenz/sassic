require 'open-uri'
require 'hpricot'

class Sassic::Builder
  def initialize(server, options={})
    @server = server
    @relative = options[:relative]
    @stylesheets = []
  end
  
  def run!
    create_output_directory
    
    # Static pages must be generated before stylesheets
    puts "Generating pages..."
    generate_static_pages
    
    puts "Generating stylesheets..."
    generate_stylesheets
    
    puts "Copying images..."
    copy_images
    
    puts "Copying javascripts..."
    copy_javascripts
    
    if @relative
      puts "Relativizing paths..."
      relativize_paths
    end
    
    puts "Build completed."
  end

private
  def create_output_directory
    FileUtils.rm_r('output') if File.exists?('output')
    FileUtils.mkdir_p('output')
  end
  
  def generate_static_pages
    template_files.each do |template|
      file = template.sub(/^templates\//, '').sub(/\.erb$/, '')
      path = file.sub(/\.html/, '')
      
      content = fetch_and_write(path, file)
      extract_stylesheets(content)
    end
  end
  
  def generate_stylesheets
    FileUtils.mkdir_p('output/stylesheets')
    @stylesheets.each { |stylesheet| fetch_and_write(stylesheet, stylesheet) }
  end
  
  def copy_images
    FileUtils.cp_r 'images', 'output/images'
  end
  
  def copy_javascripts
    FileUtils.cp_r 'javascripts', 'output/javascripts'
  end
  
  def relativize_paths
    files = Dir['output/**/*.{html,js,css}']
    files.each do |file|
      dirs = File.dirname(file).count('/')
      prefix = dirs == 0 ? './' : (['../'] * dirs).join

      content = open("#{file}").read
      replaced = content.gsub(/\/(images|javascripts|stylesheets)/, "#{prefix}\\1")
      File.open(file, 'w') { |f| f.write(replaced) }
    end
  end
  
  def template_files
    Dir['templates/**/*.html.erb'] - ['templates/layout.html.erb'] - Dir['templates/**/_*.html.erb']
  end
  
  def fetch_and_write(path, file)
    content = open("#{@server}/#{path}").read
    File.open("output/#{file}", 'w') { |f| f.write(content) }
    content
  end
  
  def extract_stylesheets(content)
    doc = Hpricot(content)
    (doc/'link[@rel="stylesheet"]').each do |stylesheet|
      src = stylesheet.attributes['href'].gsub(/^\//, '')
      @stylesheets << src unless @stylesheets.include?(src)
    end
  end
end
