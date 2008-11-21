require 'sass'

class Sassic::Handlers::StylesheetHandler
  def call(env)
    sass = Dir::pwd + '/sass' + env['PATH_INFO'].sub(/\.css$/, '.sass')
    
    # Ensure logger shows correct path
    env['PATH_INFO'] = env['REQUEST_URI']
    
    if File.exists?(sass)
      [200, { 'Content-Type' => 'text/css' }, sassify(sass)]
    else
      env['rack.showstatus.detail'] = "Missing file #{sass}"
      [404, {}, '']
    end
  end

private
  def sassify(file)
    Sass::Engine.new(File.read(file), :style => :expanded, :load_paths => Dir::pwd + '/sass').render
  end
end
