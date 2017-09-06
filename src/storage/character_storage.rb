require_relative '../character.rb'

class CharacterStorage
  attr_accessor :path
  attr_accessor :files
  attr_accessor :characters

  def initialize()
    @characters = Array.new()
    @path = "data/characters/"
    @files = Dir.glob("#{@path}*.csv")
    @files.each do |file|
      character = Character.new()
      character.load_character(file.split("/").last().split(".").first())
      @characters << character
    end
  end

  def get_character(character_name)
    return_character = Character.new()
    @characters.each() do |character|
      if character.character_name.downcase == character_name.downcase
        return_character = character
      end
    end
    return return_character
  end
end
