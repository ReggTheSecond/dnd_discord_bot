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
      spell = load_spell_as_YAML(file.split("/").last().split(".").first())
      @spells << spell
    end
  end

  def puts_spell(spell_name)
    thing = ""
    @spells.each() do |spell|
      if spell.spell_name.downcase == spell_name.downcase
        return spell.to_string()
      else
        thing = ""
      end
    end
    return thing
  end

  def is_a_spell(spell_name)
    spell_or_not = false
    @spells.each do |spell|
      spell_or_not =  spell_name == spell.spell_name
    end
  end

  def save_spell_as_YAML(spell)
    File.open("data/spells/#{spell.spell_name}.yaml", 'w') do |file|
        file.puts YAML::dump(spell)
    end
  end

  def load_spell_as_YAML(file)
    return YAML.load_file("data/spells/#{file}.yaml")
  end
end

# store = SpellStorage.new()
#
#
#
# spell = Spell.new()
# spell.spell_name = "Magic Missile"
# spell.spell_level = 1
# spell.school = "Evocation"
# spell.casting_time = "1 action"
# spell.range = "120 feet"
# spell.components = "V, S"
# spell.duration = "Instantaneous"
# spell.spell_description = "You create three glowing darts of magical force. Each dart hits
#   a creature of your choice that you can see within range. A dart deals 1d4+1 force
#   damage to its target. The darts all strike simultaneously and you can direct them
#   to hit one creature or several."
# spell.at_higher_levels = "When you cast this spell using a spell slot of 2nd level or higher,
#     the spell creates one more dart for each slot above 1st."
#
# store.save_spell_as_YAML(spell)
