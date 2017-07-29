class Classes
  attr_accessor :classes
  attr_accessor :primal_paths
  attr_accessor :bardic_schools

  def initialize
    @classes = Array.new()
    @classes << "barbarian" << "bard" << "cleric" << "druid" << "fighter" << "monk" << "paladin" << "ranger" << "rouge" << "sorcerer" << "warlock" << "wizard"
    @primal_paths = Array.new()
    @primal_paths << "path of the berserker" << "path of the totem warrior"
    @bardic_schools = Array.new()
    @bardic_schools << "school of lore"
  end

  def is_a_class(character_class)
    return @classes.include?(character_class)
  end

  def is_correct_archetype(character_class, class_archetype)
    case character_class
    when "barbarian"
      return @primal_paths.include?(class_archetype)
    when "bard"
      return @bardic_schools.include?(class_archetype)
    end
  end
end
