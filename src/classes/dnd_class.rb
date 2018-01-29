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
  attr_accessor :abilities

  attr_accessor :spells_storage
  attr_accessor :skills
  attr_accessor :number_of_skills_to_choose


  def initialize()
    @class_archetypes = Array.new()
    @saving_throws = Array.new()
    @available_spells = Array.new()
    @proficiencies = Array.new()

    @abilities = Hash.new()

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

  def selectable_skills()
    skills = ""
    @proficiencies.each do |skill|
      skills << "#{skill},"
    end

    return skills
  end

  def abilities_at_level(level)
    abilities = ""
    if level.class == Fixnum
      abilities = @abilities["level #{level}"]
    else
      abilities = @abilities[level.downcase]
    end
    return abilities
  end

  def all_class_abilities()
    abilities = ""
    @abilities.each_value() do |value|
      abilities << "#{value}\n"
    end
    return abilities
  end

  def save_class_as_YAML(thing)
    File.open("data/classes/Druid.yaml", 'w') do |file|
        file.puts YAML::dump(thing)
    end
  end

  def load_class_as_YAML(class_to_load)
    return YAML.load_file("data/classes/#{class_to_load}.yaml")
  end

  def to_string()
    return "#{class_name}"
  end
end
