module Sassic::Tasks
  def self.generate(target)
    Sassic::Generator.new(target).run!
  end
  
  def self.build(options={})
    port = options[:port] || 2000
    
    # TODO: Start a new server
    
    # Run builder
    Sassic::Builder.new("http://localhost:#{port}", options).run!
  end
end
