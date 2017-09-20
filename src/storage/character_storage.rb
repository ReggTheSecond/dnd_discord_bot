require_relative '../character/character.rb'

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
end
