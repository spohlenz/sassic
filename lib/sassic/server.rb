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
      
      use Rack::Static, :urls => [ "/images", "/javascripts", "/assets" ]
      
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
end
