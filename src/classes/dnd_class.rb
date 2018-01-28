require "yaml"
require_relative '../spells/spell.rb'
require_relative '../storage/spells_storage.rb'
require_relative '../skills.rb'
require_relative '../proficiencies.rb'

class DnDClass
  attr_accessor :class_name
  attr_accessor :class_archetypes
  attr_accessor :hit_points_at_first_level
  attr_accessor :hit_points_at_higher_levels
  attr_accessor :hit_die
  attr_accessor :saving_throws
  attr_accessor :available_spells
  attr_accessor :proficiencies
  attr_accessor :starting_equipment

  attr_accessor :spells_storage
  attr_accessor :skills


  def initialize()
    @class_archetypes = Array.new()
    @saving_throws = Array.new()
    @available_spells = Array.new()
    @proficiencies = Array.new()

    @spells_storage = SpellStorage.new()
    @skills = Skills.new()
  end

  def add_spell(spell_name)
    if @spells_storage.is_a_spell(spell_name)
      available_spells << spell_name
    end
  end

  def add_proficiency(proficiency)
    proficiencies = Proficiencies.new()
    if @skills.is_a_skill(proficiency.downcase)
      @proficiencies << proficiency.downcase
    elsif proficiencies.is_a_weapon_type(proficiency.downcase)
      @proficiencies << proficiency.downcase
    elsif proficiencies.is_an_armor_type(proficiency.downcase)
      @proficiencies << proficiency.downcase
    elsif proficiencies.is_a_saving_throw(proficiency.downcase)
      @proficiencies << proficiency.downcase
    elsif proficiencies.is_a_tools_set(proficiency.downcase)

    end
  end

  def save_class_as_YAML(thing)
    File.open("data/classes/Druid.yaml", 'w') do |file|
        file.puts YAML::dump(thing)
    end
  end

  def to_string()
    return "#{class_name}\n#{class_archetypes}\n\n#{level_two_ability_name}\n#{level_two_ability_description}"
  end
end

thing = DnDClass.new()
thing.class_name = "Druid"
thing.hit_points_at_first_level = "8 + Con"
thing.hit_points_at_higher_levels = "1d8 + Con"
thing.add_spell("Animate Dead")
thing.add_spell("Arcane Eye")
thing.add_proficiency("Arcana")
thing.add_proficiency("Animal Handling")
thing.add_proficiency("Insight")
thing.add_proficiency("Medicine")
thing.add_proficiency("Nature")
thing.add_proficiency("Perception")
thing.add_proficiency("Religion")
thing.add_proficiency("Survival")
thing.add_proficiency("light")
thing.add_proficiency("medium")
thing = thing.save_class_as_YAML(thing)
