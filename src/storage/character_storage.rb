require_relative '../character/character.rb'

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
    File.open("data/characters/#{character.character_name}.ymal", 'w') do |file|
        file.puts YAML::dump(character)
    end
  end

  def load_characters_as_YAML(file)
    return YAML.load_file(file)
  end
end

store = CharacterStorage.new()

char = Character.new()
# char.character_name = "Tia"
# char.race = "Teifling"
# char.character_class = "Fighter"
# char.add_proficiency("athletics")
# char.add_proficiency("investigation")
# char.add_proficiency("intimidation")
# char.set_character_weapon("Long Sword")

store.save_character_as_YAML(char)
