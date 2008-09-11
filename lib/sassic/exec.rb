class Sassic::Exec
  def self.run!
    target, options = parse_options!
    
    if target == 'build'
      # Build static output
      Sassic::Tasks.build(options)
    elsif target
      # Create new sassic site
      Sassic::Tasks.generate(target)
    else
      # Start server
      port = options[:port] && options[:port] > 0 ? options[:port] : 2000
      Sassic::Server.new(port).start
    end
  end

private
  def self.parse_options!
    options = {}
    
    OptionParser.new do |opts|
      opts.banner = <<-EOF
Usage: sassic <target>               # Create a new sassic site
       sassic [options]              # Starts the sassic server
       sassic build [options]        # Build static output

EOF

      opts.on('-p', '--port N', 'Specify port number (defaults to 2000)') do |port|
        options[:port] = port.to_i
      end

      opts.on('-r', '--relative', 'When used with build, makes all paths in the output relative') do
        options[:relative] = true
      end
      
      opts.on('-o', '--output DIR', 'When used with build, output files in into specified directory') do |output|
        options[:output] = output
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end.parse!
    
    [ ARGV.first, options ]
  end
end
