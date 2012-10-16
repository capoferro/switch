module Kernel
  def switch(switcher, &block)
    Switch.new(switcher, &block).execute
  end
end
