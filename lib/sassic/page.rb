require 'erb'

class Sassic::Page
  def initialize(template)
    @template = template
    @template_content = File.read(template_path(template)) if exists?
    @layout_content = File.read(layout_path)
    
    # Preparse template content
    content
  end
  
  def template_path(template)
    Dir::pwd + '/templates/' + template + '.html.erb'
  end
  
  def layout_path
    Dir::pwd + '/templates/layout.html.erb'
  end
  
  def exists?
    File.exists?(template_path(@template))
  end
  
  def content
    ERB.new(@template_content).result(binding)
  end
  
  def page
    @template
  end
  
  def partial(template)
    ERB.new(File.read(template_path("_#{template}"))).result(binding)
  end
  
  def title(new_title=nil)
    @title = new_title if new_title
    @title
  end
  
  def body_classes(new_classes=nil)
    @body_classes = new_classes if new_classes
    @body_classes
  end
  
  def render
    ERB.new(@layout_content).result(binding)
  end
end
