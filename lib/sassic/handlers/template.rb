require File.dirname(__FILE__) + '/../page'

class Sassic::Handlers::TemplateHandler
  def call(env)
    path = env['PATH_INFO'].sub(/^\//, '')
    page = Sassic::Page.new(path == '' ? 'index' : path)
    
    if page.exists?
      [200, { 'Content-Type' => 'text/html' }, page.render]
    else
      env['rack.showstatus.detail'] = "Missing template #{page.template_path}"
      [404, {}, '']
    end
  end
end
