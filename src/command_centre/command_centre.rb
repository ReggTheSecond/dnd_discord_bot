require_relative '../storage/character_storage.rb'
require_relative '../dice_roller/dice_roller.rb'
require_relative 'command_parsing_utility.rb'

class CommandCentre < CommandParsingUtility
  attr_accessor :characterStorage
  attr_accessor :diceRoller

  def initialize()
    @characterStorage = CharacterStorage.new()
    @diceRoller = DiceRoller.new()
  end

  def process_command(command)
    case command.downcase()
    when /^skill:.+;character:.+/
      return @diceRoller.roll_skill(get_character(parse_character(command)), parse_skill(command))
    when /^character:.+;spell:+./
      return @spells.cast(get_character(parse_character(command)), parse_spell(command))
    when /^character:.+;attack$/
      return @diceRoller.roll_attack(get_character(parse_character(command)))
    when /^character:.+;weapon damage$/
      return @diceRoller.roll_weapon_damage(get_character(parse_character(command)))
    when /^character:.+;spell list$/
      return get_character(parse_character(command)).list_spells()
    when /^character:.+;spell slots$/
      return get_character(parse_character(command)).spells_slots()
    end
  end

  def list_characters_by_name()
    @characterStorage.characters.each { |char|
      puts char.character_name
    }
  end

  def get_character(requested_character)
    return_character = Character.new()
    @characterStorage.characters.each() do |character|
      if character.character_name.downcase == requested_character.downcase
        return_character = character
      end
    end
    return return_character
  end
end

thing = CommandCentre.new()
puts thing.process_command("character:Narset;spell list")
