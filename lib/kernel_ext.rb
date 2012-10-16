module Kernel
  def switch(switcher, &block)
    Switch.execute(switcher, &block)
  end
end
