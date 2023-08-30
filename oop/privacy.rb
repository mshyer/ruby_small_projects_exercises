class Machine
  def initialize
    @switch = :on
  end
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_state
    "The switch is currently #{switch}"
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end

end

machine = Machine.new

p machine.switch_state
machine.stop
p machine.switch_state
