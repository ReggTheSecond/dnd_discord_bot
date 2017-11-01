require "yaml"

class DnDClass
  attr_accessor :class_name
  attr_accessor :class_archetypes
  attr_accessor :hit_points_at_first_level
  attr_accessor :hit_points_at_higher_levels
  attr_accessor :hit_dice
  attr_accessor :saving_throws
  attr_accessor :available_spells
  attr_accessor :proficiencies
  attr_accessor :starting_equipment

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

  def initialize()
  end
end
