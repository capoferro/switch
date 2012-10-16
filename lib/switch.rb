require 'kernel_ext'

class Switch
  ALWAYS_EXECUTE = Object.new

  class << self
    alias :execute :new
  end

  def initialize(switcher, &block)
    @block = block
    @procs = []
    @switcher = switcher
  end

  def execute
    instance_eval(&@block)
    execute_procs(@switcher)
  end

  def match(matcher, &block)
    block ||= Proc.new {}
    @procs << [matcher, block]
  end

  def all(&block)
    match(ALWAYS_EXECUTE, &block)
  end

  def execute_procs(switcher)
    matched = false
    @procs.each do |matcher, proc|
      next unless matched || matcher == switcher || matcher.object_id == ALWAYS_EXECUTE.object_id
      matched = true
      proc.call
    end
  end
end
