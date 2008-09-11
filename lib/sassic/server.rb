require 'webrick'

require File.dirname(__FILE__) + '/servlets'

class Sassic::Server
  include WEBrick
  
  def initialize(port=2000)
    @port = port
  end
  
  def start(options={})
    s = HTTPServer.new(options.merge(:Port => @port))
    setup_mount_points(s)
    trap("INT") { s.shutdown }
    s.start
  end
  
private
  def setup_mount_points(s)
    setup_static_mount_point(s, '/javascripts')
    setup_static_mount_point(s, '/images')
    s.mount("/stylesheets", Sassic::Servlets::SassServlet)
    s.mount("/", Sassic::Servlets::LayoutServlet)
  end
  
  def setup_static_mount_point(s, folder)
    s.mount(folder, HTTPServlet::FileHandler, Dir::pwd + folder)
  end
end
