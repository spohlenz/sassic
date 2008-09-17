require File.dirname(__FILE__) + '/../page'

class Sassic::Servlets::TemplateServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    page = Sassic::Page.new(req.path == '/' ? 'index' : req.path.sub(/^\//, ''))
    
    if page.exists?
      res.body = page.render
    else
      res.status = 404
      res.body = "<h1>404 Not Available</h1>"
    end
  end
end
