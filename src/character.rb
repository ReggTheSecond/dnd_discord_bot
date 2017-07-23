require_relative 'skills.rb'
require_relative 'classes.rb'

class Character
  attr_accessor :character_name
  attr_accessor :race
  attr_accessor :character_class
  attr_accessor :class_archetype
  attr_accessor :alighnment
  attr_accessor :experience
  attr_accessor :strength
  attr_accessor :constitution
  attr_accessor :dexterity
  attr_accessor :intelligence
  attr_accessor :wisdom
  attr_accessor :charisma
  attr_accessor :weapon_slot_one
  attr_accessor :weapon_slot_two
  attr_accessor :shield_slot
  attr_accessor :armor_slot
  attr_accessor :boots_slot
  attr_accessor :gloves_slot
  attr_accessor :ring_slot_one
  attr_accessor :ring_slot_two
  attr_accessor :neck_slot
  attr_accessor :head_slot
  attr_accessor :attuned_item_one
  attr_accessor :attuned_item_two
  attr_accessor :proficiency
  attr_accessor :expertise

  attr_accessor :classes
  attr_accessor :skills

  def initialize()
    roll_stats()
    @proficiency = Array.new()
    @expertise = Array.new()
    @classes = Classes.new()
    @skills = Skills.new()
  end

  def roll_stats()
    @strength = roll_stat()
    @constitution = roll_stat()
    @dexterity = roll_stat()
    @intelligence = roll_stat()
    @wisdom = roll_stat()
    @charisma = roll_stat()
    while two_stats_are_not_fifteen_or_above()
      @strength = roll_stat()
      @constitution = roll_stat()
      @dexterity = roll_stat()
      @intelligence = roll_stat()
      @wisdom = roll_stat()
      @charisma = roll_stat()
    end
  end

  def roll_stat()
    rnd = Random.new()
    stats = Array.new()
    stats = [rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6)]
    stats = stats.sort()
    return (stats[3] + stats[2] + stats[1])
  end

  def two_stats_are_not_fifteen_or_above()
    if @strength >= 15
      onestat = true
    end
    if @constitution >= 15 && onestat
      twostat = true
    elsif @constitution >= 15
      onestat = true
    end
    if @dexterity >= 15 && onestat
      twostat = true
    elsif @dexterity >= 15
      onestat = true
    end
    if @intelligence >= 15 && onestat
      twostat = true
    elsif @intelligence >= 15
      onestat = true
    end
    if @wisdom >= 15 && onestat
      twostat = true
    elsif @wisdom >= 15
      onestat = true
    end
    if @charisma >= 15 && onestat
      twostat = true
    elsif @charisma >= 15
      onestat = true
    end
    if onestat && twostat
      return false
    else
      return true
    end
  end

  def roll_skill(skill)
    rnd = Random.new()
    if is_proficient(skill)
      if is_expert(skill)
        roll_total = rnd.rand(1..20) + (proficiency_bonus() * 2) + attribute_bonus(skill)
      else
        roll_total = rnd.rand(1..20) + proficiency_bonus() + attribute_bonus(skill)
      end
    else
      roll_total = rnd.rand(1..20) + attribute_bonus(skill)
    end
    return roll_total
  end

  def proficiency_bonus()
    if @experience <= 2700
      return 2
    elsif @experience <= 34000
      return 3
    elsif @experience <= 100000
      return 4
    elsif @experience <= 195000
      return 5
    else
      return 6
    end
  end

  def attribute_bonus(skill)
    attribute = @skills.attribute_for_skill(skill.downcase)
    case attribute.downcase()
    when "strength"
      attribute_score = @strength
    when "constitution"
      attribute_score = @constitution
    when "dexterity"
      attribute_score = @dexterity
    when "intelligence"
      attribute_score = @intelligence
    when "wisdom"
      attribute_score = @wisdom
    when "charisma"
      attribute_score = @charisma
    end

    if attribute_score > 10
      attribute_score = (attribute_score - 10) / 2
    elsif attribute_score == 10
      attribute_score = 0
    else
      attribute_score = attribute_score / 2
      attribute_score = attribute_score - (attribute_score + 1)
    end
    return attribute_score
  end

  def add_class(character_class)
    if classes.is_a_class(character_class.downcase)
      @character_class = character_class
    end
  end

  def add_proficiency(proficiency)
    if @skills.is_a_skill(proficiency.downcase)
      @proficiency << proficiency.downcase
    end
  end

  def is_proficient(skill)
    return @proficiency.include?(skill.downcase)
  end

  def add_expertise(expertise)
    if @skills.is_a_skill(expertise.downcase)
      if is_proficient(expertise)
        @expertise << expertise.downcase
      end
    end
  end

  def is_expert(skill)
    return @expertise.include?(skill.downcase)
  end

  def save_to_csv()
    character_sheet = File.open("data/characters/#{character_name}", 'a+')
    character_sheet << "#{@character_name}~#{@race}~#{@character_class}~#{@experience}~#{@strength}~#{@constitution}~#{@dexterity}~#{@intelligence}~#{@wisdom}~#{@charisma}~#{@proficiency}~#{@expertise}"
    character_sheet.close()
  end

  def load_character(character_name)
    character_sheet = File.open("data/characters/#{character_name}", 'r')
    character_sheet.each_line() do |line|
      character = line.split("~")
    end

  end

  def to_string()
    return "Name: #{@character_name}\nRace: #{@race}\nClass: #{@character_class}\nStrength: #{@strength}\nConstitution: #{@constitution}\nDexterity: #{@dexterity}\nIntelligence: #{@intelligence}\nWisdom: #{@wisdom}\nCharisma: #{@charisma}"
  end
end

relg = Character.new()
relg.character_name = "Relg"
relg.race = "Dwarf"
relg.add_class("Monk")
relg.experience = 1300
relg.add_proficiency("History")
relg.add_expertise("History")
relg.add_proficiency("Perception")
relg.roll_stats
puts relg.to_string()
relg.save_to_csv()
puts "Roll #{relg.roll_skill("History")}"
