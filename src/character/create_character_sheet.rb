require_relative 'character.rb'

class CreateCharacterSheet
  attr_accessor :new_character

  def initialize()
  end

  def generate(event)
    @new_character = Character.new()
    roll_attributes?(event)
    name_character(event)
    sleep 8
    choose_races(event)
    sleep 8
    choose_class(event)
    sleep 8
    choose_skills(event)
  end

  def name_character(event)
    event.respond "Character Name:"
    event.bot.message(with_text: /^.+/) do |respond_event|
      if @new_character.character_name == nil
        @new_character.character_name = respond_event.content.to_s()
      end
    end
  end

  def choose_races(event)
    event.respond "Choose a race from amoung - Dwarf, Dragonborn, Elf, Human, Gnome, Half-Elf, Half-Orc, Teifling."
    event.bot.message(with_text: /^.+/) do |respond_event|
    if @new_character.race == nil
      @new_character.race = respond_event.content.to_s()
    end
    end
  end

  def choose_class(event)
    event.respond "Choose class from amoung - Barbarian, Bard, Cleric, Druid, Fighter, Monk, Paladin, Ranger, Rogue, Sorcerer, Warlock, Wizard."
    event.bot.message(with_text: /^.+/) do |respond_event|
    if @new_character.get_class_name == nil
      @new_character.set_class(respond_event.content.to_s())
    end
    end
  end

  def choose_skills(event)
    event.respond "Choose #{@new_character.character_class.number_of_skills_to_choose} from amoung (seperate with a comma):\n
    #{@new_character.character_class.selectable_skills()}"
    event.bot.message(with_text: /^.+/) do |respond_event|
      # choosen = respond_event.content.to_s().split(",")
      # if choosen.size == @new_character.character_class.number_of_skills_to_choose
        @new_character.add_proficiency(respond_event.content.to_s().split(",").first)
        @new_character.add_proficiency(respond_event.content.to_s().split(",").last)
        respond_event.respond @new_character.to_string()
      # else
      #   choose_skills(event)
      # end
    end
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
    @new_character.roll_stats
  end

  def custom_attribute(event)

  end

  def add_discription(event)

  end
end
