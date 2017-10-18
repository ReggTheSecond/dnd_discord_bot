class Wizard
  attr_accessor :at_level_1
  attr_accessor :at_level_2
  attr_accessor :at_level_3
  attr_accessor :at_level_4
  attr_accessor :at_level_5
  attr_accessor :at_level_6
  attr_accessor :at_level_7
  attr_accessor :at_level_8
  attr_accessor :at_level_9
  attr_accessor :at_level_10
  attr_accessor :at_level_11
  attr_accessor :at_level_12
  attr_accessor :at_level_13
  attr_accessor :at_level_14
  attr_accessor :at_level_15
  attr_accessor :at_level_16
  attr_accessor :at_level_17
  attr_accessor :at_level_18
  attr_accessor :at_level_19
  attr_accessor :at_level_20

  def initialize
    super("wizard")
    inport_wizard()
  end

  def inport_wizard()
    dnd_class = File.open("/data/classes/wizard.csv", 'r')
    dnd_class.each_line() do |line|
      case line
      when /^at level 1/
      end
    end
  end
end
