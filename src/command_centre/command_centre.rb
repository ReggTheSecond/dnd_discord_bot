require_relative '../storage/character_storage.rb'
require_relative '../dice_roller/dice_roller.rb'
require_relative 'command_parsing_utility.rb'
require_relative '../storage/spells_storage.rb'
require_relative '../storage/items_storage.rb'

class CommandCentre < CommandParsingUtility
  attr_accessor :characterStorage
  attr_accessor :diceRoller
  attr_accessor :items
  attr_accessor :spells

  def initialize()
    @characterStorage = CharacterStorage.new()
    @diceRoller = DiceRoller.new()
    @spells = SpellStorage.new()
    @items = ItemsControl.new()
  end

  def process_command(command)
    case command.downcase()
    when /^skill:.+;character:.+/
      return @diceRoller.roll_skill(get_character(parse_character(command)), parse_skill(command))
    when /^character:.+;attack$/
      return @diceRoller.roll_attack(get_character(parse_character(command)))
    when /^character:.+;weapon damage$/
      return @diceRoller.roll_weapon_damage(get_character(parse_character(command)))
    when /^character:.+;spell list$/
      return get_character(parse_character(command)).list_spells()
    when /^character:.+;spell slots$/
      return get_character(parse_character(command)).spells_slots()
    when /^spell:+./
      return @spells.puts_spell(parse_spell(command))
    when /^weapon:+./
      return @items.get_weapon(parse_weapon(command)).to_string()
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

centre = CommandCentre.new()

puts centre.process_command("skill:history;character:Narset")
puts centre.process_command("character:Narset;attack")
puts centre.process_command("character:Narset;weapon damage")
puts centre.process_command("character:Narset;spell list")
puts centre.process_command("spell:Magic Missile")
puts centre.process_command("weapon:short sword")
