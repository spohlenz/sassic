module Sassic::Tasks
  def self.generate(target)
    Sassic::Generator.new(target).run!
  end
  
  def self.build(options={})
    port = options[:port] && options[:port] > 0 ? options[:port] : 2000
    Sassic::Builder.new("http://localhost:#{port}", options).run!
  end
end
