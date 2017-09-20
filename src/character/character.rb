require_relative '..skills.rb'
require_relative '..classes.rb'
require_relative '..dice_roller.rb'
require_relative '..proficiencies.rb'
require_relative '..storage/items_storage.rb'
require_relative 'character_utility.rb'

class Character < CharacterUtility
  attr_accessor :character_name
  attr_accessor :race
  attr_accessor :character_class
  attr_accessor :class_archetype
  attr_accessor :proficiency
  attr_accessor :expertise
  attr_accessor :alighnment
  attr_accessor :experience
  attr_accessor :strength
  attr_accessor :constitution
  attr_accessor :dexterity
  attr_accessor :intelligence
  attr_accessor :wisdom
  attr_accessor :charisma
  attr_accessor :inventory
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

  attr_accessor :classes
  attr_accessor :skills
  attr_accessor :items

  def initialize()
    roll_stats()
    @proficiency = Array.new()
    @expertise = Array.new()
    @classes = Classes.new()
    @skills = Skills.new()
    @items = ItemsControl.new()
  end

  def roll_stats()
    dice = DiceRoller.new()
    @strength = dice.roll_stat()
    @constitution = dice.roll_stat()
    @dexterity = dice.roll_stat()
    @intelligence = dice.roll_stat()
    @wisdom = dice.roll_stat()
    @charisma = dice.roll_stat()
    while two_stats_are_not_fifteen_or_above()
      @strength = dice.roll_stat()
      @constitution = dice.roll_stat()
      @dexterity = dice.roll_stat()
      @intelligence = dice.roll_stat()
      @wisdom = dice.roll_stat()
      @charisma = dice.roll_stat()
    end
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

    return get_attribute_score(attribute_score)
  end

  def attack_attribute()
    if @weapon_slot_one.is_finesse()
      if @dexterity > @strength
        attribute_score = @dexterity
      end
    else
      attribute_score = @strength
    end
    return get_attribute_score(attribute_score)
  end

  def add_class(character_class)
    if classes.is_a_class(character_class.downcase)
      @character_class = character_class
    end
  end
  def is_proficient(skill)
    return @proficiency.include?(skill.downcase)
  end

  def is_expert(skill)
    return @expertise.include?(skill.downcase)
  end

  def save_to_csv()
    template = File.open("data/templates/tamplate.csv", 'r')
    sheet=""
    template.each_line do |line|
      sheet << line
    end
    sheet = sheet.gsub("character_name~", "character_name~#{@character_name}")
    sheet = sheet.gsub("race~", "race~#{@race}")
    sheet = sheet.gsub("character_class~", "character_class~#{@character_class}")
    sheet = sheet.gsub("class_archetype~", "class_archetype~#{@class_archetype}")
    sheet = sheet.gsub("proficiency~", "proficiency~#{@proficiency}")
    sheet = sheet.gsub("expertise~", "expertise~#{@expertise}")
    sheet = sheet.gsub("alighnment~", "alighnment~#{@alighnment}")
    sheet = sheet.gsub("experience~", "experience~#{@experience}")
    sheet = sheet.gsub("strength~", "strength~#{@strength}")
    sheet = sheet.gsub("constitution~", "constitution~#{@constitution}")
    sheet = sheet.gsub("dexterity~", "dexterity~#{@dexterity}")
    sheet = sheet.gsub("intelligence~", "intelligence~#{@intelligence}")
    sheet = sheet.gsub("wisdom~", "wisdom~#{@wisdom}")
    sheet = sheet.gsub("charisma~", "charisma~#{@charisma}")
    sheet = sheet.gsub("inventory~", "inventory~#{@inventory}")
    sheet = sheet.gsub("weapon_slot_one~", "weapon_slot_one~#{@weapon_slot_one}")
    sheet = sheet.gsub("weapon_slot_two~", "weapon_slot_two~#{@weapon_slot_two}")
    sheet = sheet.gsub("shield_slot~", "shield_slot~#{@shield_slot}")
    sheet = sheet.gsub("armor_slot~", "armor_slot~#{@armor_slot}")
    sheet = sheet.gsub("boots_slot~", "boots_slot~#{@boots_slot}")
    sheet = sheet.gsub("gloves_slot~", "gloves_slot~#{@gloves_slot}")
    sheet = sheet.gsub("ring_slot_one~", "ring_slot_one~#{@ring_slot_one}")
    sheet = sheet.gsub("ring_slot_two~", "ring_slot_two~#{@ring_slot_two}")
    sheet = sheet.gsub("neck_slot~", "neck_slot~#{@neck_slot}")
    sheet = sheet.gsub("head_slot~", "head_slot~#{@head_slot}")
    sheet = sheet.gsub("attuned_item_one~", "attuned_item_one~#{@attuned_item_one}")
    sheet = sheet.gsub("attuned_item_two~", "attuned_item_two~#{@attuned_item_two}")
    sheet = sheet.gsub("attuned_item_three~", "attuned_item_three~#{@attuned_item_three}")
    character_sheet = File.open("data/characters/#{character_name.downcase}.csv", 'w')
    character_sheet << sheet
    character_sheet.close()
  end

  def load_character(character_name)
    character_sheet = File.open("data/characters/#{character_name.downcase}.csv", 'r')
    temp_skills = ""
    character_sheet.each_line() do |line|
      if line.include?("character_name~")
        @character_name = line.split("~").last().strip()
      elsif line.include?("race~")
        @race = line.split("~").last().strip()
      elsif line.include?("character_class~")
        @character_class = line.split("~").last().strip()
      elsif line.include?("class_archetype~")
        @class_archetype = line.split("~").last().strip()
      elsif line.include?("proficiency~")
        temp_skills = line.split("\"]").first().split("[\"").last()
        if temp_skills.include?("\", \"")
          skills = temp_skills.split("\", \"")
          skills.each() do |skill|
            add_proficiency(skill)
          end
        else
          add_proficiency(temp_skills)
        end
      elsif line.include?("expertise~")
        temp_skills = line.split("\"]").first().split("[\"").last()
        if temp_skills.include?("\", \"")
          skills = temp_skills.split("\", \"")
          skills.each() do |skill|
            add_expertise(skill)
          end
        else
          add_expertise(temp_skills)
        end
      elsif line.include?("alighnment~")
        @alighnment = line.split("~").last().strip()
      elsif line.include?("experience~")
        @experience = line.split("~").last().to_i()
      elsif line.include?("strength~")
        @strength = line.split("~").last().to_i()
      elsif line.include?("constitution~")
        @constitution = line.split("~").last().to_i()
      elsif line.include?("dexterity~")
        @dexterity = line.split("~").last().to_i()
      elsif line.include?("intelligence~")
        @intelligence = line.split("~").last().to_i()
      elsif line.include?("wisdom~")
        @wisdom = line.split("~").last().to_i()
      elsif line.include?("charisma~")
        @charisma = line.split("~").last().to_i()
      elsif line.include?("inventory~")
        @inventory = line.split("~").last().strip()
      elsif line.include?("weapon_slot_one~")
        @weapon_slot_one = Weapon.new()
        @weapon_slot_one = @items.get_weapon(line.split("~").last().strip())
        # puts @character_name
        # puts @weapon_slot_one.class
      elsif line.include?("weapon_slot_two~")
        @weapon_slot_two = line.split("~").last().strip()
      elsif line.include?("shield_slot~")
        @shield_slot = line.split("~").last().strip()
      elsif line.include?("armor_slot~")
        @armor_slot = line.split("~").last().strip()
      elsif line.include?("boots_slot~")
        @boots_slot = line.split("~").last().strip()
      elsif line.include?("gloves_slot~")
        @gloves_slot = line.split("~").last().strip()
      elsif line.include?("ring_slot_one~")
        @ring_slot_one = line.split("~").last().strip()
      elsif line.include?("ring_slot_two~")
        @ring_slot_two = line.split("~").last().strip()
      elsif line.include?("neck_slot~")
        @neck_slot = line.split("~").last().strip()
      elsif line.include?("head_slot~")
        @head_slot = line.split("~").last().strip()
      elsif line.include?("attuned_item_one~")
        @attuned_item_one = line.split("~").last().strip()
      elsif line.include?("attuned_item_two~")
        @attuned_item_two = line.split("~").last().strip()
      elsif line.include?("attuned_item_three~")
        @attuned_item_three = line.split("~").last().strip()
      end
    end
  end

  def to_string()
    return "Name: #{@character_name}\nRace: #{@race}\nClass: #{@character_class}\nStrength: #{@strength}\nConstitution: #{@constitution}\nDexterity: #{@dexterity}\nIntelligence: #{@intelligence}\nWisdom: #{@wisdom}\nCharisma: #{@charisma}"
  end
end

# relg = Character.new()
# relg.character_name = "Bill"
# relg.race = "Dwarf"
# relg.add_class("Monk")
# relg.experience = 1300
# relg.add_proficiency("History")
# relg.add_proficiency("Strength")
# relg.add_expertise("History")
# relg.add_proficiency("Perception")
# relg.roll_stats
# relg.save_to_csv()
# relg.load_character("relg")
# puts relg.weapon_slot_one.class
# relg.load_character("Jim")
# puts relg.to_string()