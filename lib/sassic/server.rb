require 'rack'

require File.dirname(__FILE__) + "/handlers"

class Sassic::Server
  def initialize(port=2000)
    @port = port
  end
  
  def start(options={})
    puts "Started Sassic server on port #{@port}."
    handler.run app, :Port => @port
  end
  
private
  def app
    Rack::Builder.new {
      use Rack::CommonLogger
      use Rack::ShowExceptions
      use Rack::ShowStatus
      
      use Rack::Static, :urls => [ "/images", "/javascripts" ]
      
      map '/' do
        run Sassic::Handlers::TemplateHandler.new
      end
      
      map '/stylesheets' do
        run Sassic::Handlers::StylesheetHandler.new
      end
    }
  end
  
  def handler
    Rack::Handler::Mongrel
  end
  
  # def setup_mount_points(s)
  #   setup_static_mount_point(s, '/javascripts')
  #   setup_static_mount_point(s, '/images')
  #   s.mount("/stylesheets", Sassic::Servlets::SassServlet)
  #   s.mount("/", Sassic::Servlets::TemplateServlet)
  # end
  # 
  # def setup_static_mount_point(s, folder)
  #   s.mount(folder, HTTPServlet::FileHandler, Dir::pwd + folder)
  # end
end
