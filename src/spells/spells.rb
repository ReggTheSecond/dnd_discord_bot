require_relative 'spell.rb'

class Spells
  attr_accessor :cantrips
  attr_accessor :first_level_spells
  attr_accessor :second_level_spells
  attr_accessor :thrid__level_spells
  attr_accessor :fourth_level_spells
  attr_accessor :fifth_level_spells
  attr_accessor :sixth_level_spells
  attr_accessor :seventh_level_spells
  attr_accessor :eighth_level_spells
  attr_accessor :ninth_level_spells

  def initialize()
    @cantrips  =Array.new()
    @first_level_spells = Array.new()
    @second_level_spells = Array.new()
    @thrid__level_spells = Array.new()
    @fourth_level_spells = Array.new()
    @fifth_level_spells = Array.new()
    @sixth_level_spells = Array.new()
    @seventh_level_spells = Array.new()
    @eighth_level_spells = Array.new()
    @ninth_level_spells = Array.new()
    load_spells("cantrips")
    load_spells("1st")
    load_spells("9th")
  end

  def load_spells(spell_level)
    file = File.open("data/spells/#{spell_level}.csv")
    file.each_line do |line|
      spell = Spell.new()
      details = line.split("~")
      details.each do |detail|
        if detail.include?("spell=")
          spell.spell_name = detail.split("=").last()
        elsif detail.include?("spell_level=")
          spell.spell_level = detail.split("=").last().to_i
        elsif detail.include?("school=")
          spell.school = detail.split("=").last()
        elsif detail.include?("casting_time=")
          spell.casting_time = detail.split("=").last()
        elsif detail.include?("range=")
          spell.range = detail.split("=").last()
        elsif detail.include?("components=")
          spell.components = detail.split("=").last()
        elsif detail.include?("duration=")
          spell.duration = detail.split("=").last()
        elsif detail.include?("description=")
          spell.spell_description = detail.split("=").last().gsub("$", "\n")
        elsif detail.include?("at_higher_levels=")
          spell.at_higher_levels = detail.split("=").last().gsub("$", "\n")
        end
      end
      store_spell(spell_level, spell)
    end
  end

  def store_spell(spell_level, spell)
    case spell_level
    when "cantrips"
      @cantrips << spell
    when "1st"
      @first_level_spells << spell
    when "2nd"
      @second_level_spells << spell
    when "3rd"
      @thrid__level_spells << spell
    when "4th"
      @fourth_level_spells << spell
    when "5th"
      @fifth_level_spells << spell
    when "6th"
      @sixth_level_spells << spell
    when "7th"
      @seventh_level_spells << spell
    when "8th"
      @eighth_level_spells << spell
    when "9th"
      @ninth_level_spells << spell
    end
  end

  def is_a_spell?(spell_name)
    spell_or_not = false
    @cantrips.each do |spell|
      if spell.spell_name == spell_name
        spell_or_not = true
      end
    end

    return spell_or_not
  end

  def puts_spells()
    @cantrips.each do |spell|
      puts spell.to_string()
      puts ""
    end
    @first_level_spells.each do |spell|
      puts spell.to_string()
      puts ""
    end
    @ninth_level_spells.each do |spell|
      puts spell.to_string()
      puts ""
    end
  end
end

# spells = Spells.new()
