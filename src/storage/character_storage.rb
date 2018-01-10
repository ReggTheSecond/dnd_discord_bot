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
#
store = CharacterStorage.new()
items = ItemsControl.new()

char = Character.new()
char.character_name = "Tia"
char.race = "Dwarf"
char.character_class = "Bard"
char.experience = 100
char.add_proficiency "intelligence"
char.add_proficiency "wisdom"
char.add_proficiency "light"
char.add_proficiency "arcana"
char.add_proficiency "history"
char.add_proficiency "insight"
char.alighnment = "Evil"
char.character_weapon = items.get_weapon("long sword")
char.add_spell("Magic Missile")
char.add_spell("Acid Arrow")

store.save_character_as_YAML(char)
