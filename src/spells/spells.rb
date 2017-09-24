require_relative 'spell.rb'

class Spells
  attr_accessor :first_level_spells

  def initialize()
    @first_level_spells = Array.new()
    load_spells("1st")
  end

  def load_spells(spell_level)
    file = File.open("data/spells/#{spell_level}.csv")
    file.each_line do |line|
      spell = Spell.new()
      details = line.split("~")
      details.each do |detail|
        if detail.include?("spell=")
          spell.spell_name = detail.split("=").last()
        elsif detail.include?("casting_time=")
          spell.casting_time = detail.split("=").last()
        elsif detail.include?("range=")
          spell.range = detail.split("=").last()
        elsif detail.include?("components=")
          spell.components = detail.split("=").last()
        elsif detail.include?("duration=")
          spell.duration = detail.split("=").last()
        elsif detail.include?("description=")
          spell.spell_description = detail.split("=").last()
        elsif detail.include?("at_higher_levels=")
          spell.at_higher_levels = detail.split("=").last()
        end
      end
      @first_level_spells << spell
    end
  end

  def puts_spells()
    @first_level_spells.each do |spell|
      puts spell.to_string()
    end
  end
end

spells = Spells.new()

spells.puts_spells()
