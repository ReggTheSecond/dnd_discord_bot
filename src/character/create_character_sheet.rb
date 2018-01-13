require 'discordrb'

class CreateCharacterSheet
  attr_accessor :character_bot

  def initialize()
    token = ""
    client_id = ""
    @character_bot = Discordrb::Bot.new token: token, client_id: client_id

    @character_bot.run
    wait_for_responce()
  end

  def method_name
    @character_bot.stop()
  end

  def generate(event)

  end

  def wait_for_responce()
    responce = ""
    while responce == ""
      @character_bot.message(with_text: /.+/) do |event|
        responce = event.content.to_s()
      end
    end
    puts responce
    @character_bot.stop
  end

  def name_character(event)
    event.respond "Character Name:"
    wait_for_responce()
  end

  def choose_races()

  end

  def choose_class()

  end

  def choose_skills()

  end

  def choose_cantrips()

  end

  def choose_level_1_spells()

  end

  def choose_archetype()

  end

  def choose_weapon()

  end

  def choose_armour()

  end

  def choose_background()

  end

  def roll_attributes?()

  end

  def custom_attribute()

  end

  def add_discription()

  end
end

# thing = CreateCharacterSheet.new()

token = ""
client_id = ""
@character_bot = Discordrb::Bot.new token: token, client_id: client_id

@character_bot.run
