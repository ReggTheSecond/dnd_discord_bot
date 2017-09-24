class Spell
  attr_accessor :spell_name
  attr_accessor :casting_time
  attr_accessor :range
  attr_accessor :components
  attr_accessor :duration
  attr_accessor :spell_description
  attr_accessor :at_higher_levels
  attr_accessor :saving_throw
  attr_accessor :spell_level
  attr_accessor :school
  attr_accessor :damage_die

  def spell_tag_line()
    if @spell_level == 0
      return "#{@school} cantrip"
    else
      return "#{@spell_level}st-level #{@school}"
    end
  end

  def to_string()
    return "#{@spell_name}\n#{spell_tag_line()}\nCasting Time: #{@casting_time}\nRange: #{@range}\nComponents: #{@components}\nDuration: #{@duration}\n#{@spell_description}\nAt Higher Levels: #{@at_higher_levels}"
  end
end

spell = Spell.new()

spell.spell_name = "Magic Missile"
spell.casting_time = "1 action"
spell.range = "120 feet"
spell.components = "V, S"
spell.duration = "Instantaneous"
spell.spell_description = "You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4+1 force damage to its target. The darts all strike simultaneously and you can direct them to hit one creature or several."
spell.at_higher_levels = "When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot above 1st."

# puts spell.to_string()
