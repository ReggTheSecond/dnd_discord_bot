require "yaml"

class ClassArchetype
  attr_accessor :archetype_name
  attr_accessor :archetype_abilities

  def initialize()
    @archetype_abilities = Hash.new()
  end

  def archetype_abilities_at_level(level)
    archetype_abilities = ""
    if level.class == Fixnum
      archetype_abilities = @archetype_abilities["level #{level}"]
    else
      archetype_abilities = @archetype_abilities[level.downcase]
    end
    return archetype_abilities
  end

  def all_archetype_abilities()
    archetype_abilities = ""
    @archetype_abilities.each_value() do |value|
      archetype_abilities << "#{value}\n"
    end
    return archetype_abilities
  end
end
