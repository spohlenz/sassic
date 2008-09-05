module Sassic::Tasks
  def self.generate(target)
    Sassic::Generator.new(target).run!
  end
  
  def self.build(options={})
  end
end
