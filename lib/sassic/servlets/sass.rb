require 'sass'

class Sassic::Servlets::SassServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    sass = Dir::pwd + req.path.sub('/stylesheets', '/sass').sub(/\.css$/, '.sass')
    
    if File.exists?(sass)
      res.body = sassify(sass)
    else
      res.status = 404
    end
  end
  
  def sassify(file)
    Sass::Engine.new(File.read(file), :style => :expanded, :load_paths => Dir::pwd + '/sass').render
  end
end
