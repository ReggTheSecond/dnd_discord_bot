require_relative 'character.rb'

class CreateCharacterSheet
  attr_accessor :new_character

  def initialize()
  end

  def generate(event)
    @new_character = Character.new()
    name_character(event)
    sleep 15
    choose_races(event)
    sleep 15
    choose_class(event)
    sleep 15
  end

  def name_character(event)
    event.respond "Character Name:"
    event.bot.message(with_text: /^.+/) do |respond_event|
      @new_character.character_name = respond_event.content.to_s()
    end
  end

  def choose_races(event)
    event.respond "Choose a race from amoung - Dwarf, Dragonborn, Elf, Human, Gnome, Half-Elf, Half-Orc, Teifling."
    event.bot.message(with_text: /^.+/) do |respond_event|
      @new_character.race = respond_event.content.to_s()
    end
  end

  def choose_class(event)
    event.respond "Choose class from amoung - Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Ranger, Rogue, Sorcerer, Warlock, Wizard."
    event.bot.message(with_text: /^.+/) do |respond_event|
      @new_character.set_class(respond_event.content.to_s())
      event.respond @new_character.class.class_name
    end
  end

  def choose_skills(event)
    event.respond "Choose #{}"
  end

  def choose_cantrips(event)

  end

  def choose_level_1_spells(event)

  end

  def choose_archetype(event)

  end

  def choose_weapon(event)

  end

  def choose_armour(event)

  end

  def choose_background(event)

  end

  def roll_attributes?(event)

  end

  def custom_attribute(event)

  end

  def add_discription(event)

  end
end
