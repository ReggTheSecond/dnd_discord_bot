require_relative '../character/character.rb'
require_relative '../storage/items_storage.rb'
require "yaml"

class CharacterStorage
  attr_accessor :path
  attr_accessor :files
  attr_accessor :characters

  def initialize()
    @characters = Array.new()
    @path = "data/characters/"
    @files = Dir.glob("#{@path}*.yaml")
    @files.each do |file|
      character = Character.new()
      character = load_characters_as_YAML(file.split("/").last().split(".").first())
      @characters << character
    end
  end

  def save_character_as_YAML(character)
    File.open("data/characters/#{character.character_name}.yaml", 'w') do |file|
        file.puts YAML::dump(character)
    end
  end

  def load_characters_as_YAML(file)
    return YAML.load_file("data/characters/#{file}.yaml")
  end
end

# store = CharacterStorage.new()
# items = ItemsControl.new()
#
# char = Character.new()
# char.character_name = "Bilge"
# char.race = "Human"
# char.character_class = "Fighter"
# char.experience = 1200
# char.add_proficiency "constitution"
# char.add_proficiency "strength"
# char.add_proficiency "light"
# char.add_proficiency "long sword"
# char.add_proficiency "athletics"
# char.add_proficiency "perception"
# char.add_proficiency "survival"
# char.add_expertise "athletics"
# char.alighnment = "Lawful Evil"
# char.character_weapon = items.get_weapon("long sword")
# char.add_spell("Magic Missile")
# char.add_spell("Acid Arrow")
#
# store.save_character_as_YAML(char)
