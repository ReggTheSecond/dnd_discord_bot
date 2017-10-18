class DnDClass
  attr_accessor :class_name
  attr_accessor :class_archetypes
  attr_accessor :hit_points_at_first_level
  attr_accessor :hit_points_at_higher_levels
  attr_accessor :hit_dice
  attr_accessor :saving_throws
  attr_accessor :available_spells
  attr_accessor :available_skills
  attr_accessor :weapon_proficiencies
  attr_accessor :armour_proficiencies
  attr_accessor :tool_proficiencies

  attr_accessor :number_of_cantrips
  attr_accessor :first_level_spell_slots
  attr_accessor :second_level_spell_slots
  attr_accessor :third_level_spell_slots
  attr_accessor :fourth_level_spell_slots
  attr_accessor :fifth_level_spell_slots
  attr_accessor :sixth_level_spell_slots
  attr_accessor :seventh_level_spell_slots
  attr_accessor :eight_level_spell_slots
  attr_accessor :nineth_level_spell_slots

  def initialize(dnd_class)
    inport_class(dnd_class)
  end

  def inport_class(dnd_class_name)
    dnd_class = File.open("/data/classes/#{dnd_class_name}.csv", 'r')
    dnd_class.each_line() do |line|
      case line
      when /^class_name~/
      when /^archetype~/
      when /^hit dice~/
      when /^hit points at first level~/
      when /^hit points at higher levels~/
      when /^saving throws~/
      when /^skills proficiencies~/
      when /^weapon proficiencies~/
      when /^armour proficiencies~/
      when /^tool proficiencies~/
      when /^spell save DC~/
      when /^spell attack modifier~/
      end
    end
  end
end
