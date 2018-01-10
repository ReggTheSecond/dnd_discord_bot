require "yaml"
require_relative '../spells/spell.rb'

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

  attr_accessor :level_one_ability_name
  attr_accessor :level_two_ability_name
  attr_accessor :level_three_ability_name
  attr_accessor :level_four_ability_name
  attr_accessor :level_five_ability_name
  attr_accessor :level_six_ability_name
  attr_accessor :level_seven_ability_name
  attr_accessor :level_eight_ability_name
  attr_accessor :level_nine_ability_name
  attr_accessor :level_ten_ability_name
  attr_accessor :level_eleven_ability_name
  attr_accessor :level_twelve_ability_name
  attr_accessor :level_thirteen_ability_name
  attr_accessor :level_fourteen_ability_name
  attr_accessor :level_fifteen_ability_name
  attr_accessor :level_sixteen_ability_name
  attr_accessor :level_seventeen_ability_name
  attr_accessor :level_eighteen_ability_name
  attr_accessor :level_nineteen_ability_name
  attr_accessor :level_twenty_ability_name
  attr_accessor :level_one_ability_description
  attr_accessor :level_two_ability_description
  attr_accessor :level_three_ability_description
  attr_accessor :level_four_ability_description
  attr_accessor :level_five_ability_description
  attr_accessor :level_six_ability_description
  attr_accessor :level_seven_ability_description
  attr_accessor :level_eight_ability_description
  attr_accessor :level_nine_ability_description
  attr_accessor :level_ten_ability_description
  attr_accessor :level_eleven_ability_description
  attr_accessor :level_twelve_ability_description
  attr_accessor :level_thirteen_ability_description
  attr_accessor :level_fourteen_ability_description
  attr_accessor :level_fifteen_ability_description
  attr_accessor :level_sixteen_ability_description
  attr_accessor :level_seventeen_ability_description
  attr_accessor :level_eighteen_ability_description
  attr_accessor :level_nineteen_ability_description
  attr_accessor :level_twenty_ability_description

  def initialize()
  end

  def to_string()
    return "#{class_name}\n#{class_archetypes}\n\n#{level_two_ability_name}\n#{level_two_ability_description}"
  end
end

thing = DnDClass.new()
thing = YAML.load_file("data/classes/wizard.yaml")
puts thing.to_string()
