require_relative '../spells/spell.rb'
require_relative '../spells/spells.rb'
require "yaml"

class SpellStorage
  attr_accessor :path
  attr_accessor :files
  attr_accessor :spells

  def initialize()
    @spells = Array.new()
    @path = "data/spells/"
    @files = Dir.glob("#{@path}*.yaml")
    @files.each do |file|
      spell = spell.new()
      spell = load_spells_as_YAML(file.split("/").last().split(".").first())
      @spells << spell
    end
  end

  def save_spell_as_YAML(file_name, spell_level)
    File.open("data/spells/#{file_name}.yaml", 'w') do |file|
        file.puts YAML::dump(spell_level)
    end
  end

  def load_spell_as_YAML(file)
    return YAML.load_file(file)
  end
end

store = SpellStorage.new()

spells = Spells.new()

store.save_spell_as_YAML("cantrips", spells.cantrips)
store.save_spell_as_YAML("1st", spells.first_level_spells)
store.save_spell_as_YAML("2nd", spells.second_level_spells)
store.save_spell_as_YAML("3rd", spells.thrid__level_spells)
store.save_spell_as_YAML("4th", spells.fourth_level_spells)
store.save_spell_as_YAML("5th", spells.fifth_level_spells)
store.save_spell_as_YAML("6th", spells.sixth_level_spells)
store.save_spell_as_YAML("7th", spells.seventh_level_spells)
store.save_spell_as_YAML("8th", spells.eighth_level_spells)
store.save_spell_as_YAML("9th", spells.ninth_level_spells)
