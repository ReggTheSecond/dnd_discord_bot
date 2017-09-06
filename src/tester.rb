require_relative 'character.rb'
require_relative 'dice_roller.rb'


character = Character.new()
character.load_character("relg")
dice = DiceRoller.new()

puts dice.roll_skill(character, "perception")
