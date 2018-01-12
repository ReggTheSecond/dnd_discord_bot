require_relative '../skills.rb'
require_relative '../classes.rb'
require_relative '../dice_roller/dice_roller.rb'
require_relative '../proficiencies.rb'
require_relative '../storage/items_storage.rb'
require_relative '../storage/spells_storage.rb'
require_relative 'character_utility.rb'
require "yaml"

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
  attr_accessor :character_weapon
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
  attr_accessor :spells

  attr_accessor :classes
  attr_accessor :skills
  attr_accessor :items
  attr_accessor :spells_storage

  def initialize()
    roll_stats()
    @proficiency = Array.new()
    @expertise = Array.new()
    @classes = Classes.new()
    @skills = Skills.new()
    @items = ItemsControl.new()
    @spells_storage = SpellStorage.new()
    @spells = Array.new()
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
    if attribute == nil
      puts skill
    end
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
    if @character_weapon.finesse
      if @dexterity > @strength
        attribute_score = @dexterity
      else
        attribute_score = @strength
      end
    else
      attribute_score = @strength
    end
    return get_attribute_score(attribute_score)
  end

  def set_character_weapon(weapon)
    @character_weapon = Weapon.new()
    @character_weapon = @items.get_weapon(weapon)
  end

  def weapon_stat()
    if @character_weapon.finesse
      if @dexterity > @strength
        return "dexterity"
      end
    else
      return "strength"
    end
  end

  def set_class(character_class)
    if classes.is_a_class(character_class.downcase)
      @character_class = character_class
    end
  end

  def is_proficient(skill)
    if skill.class.to_s == "Weapon"
      return @proficiency.include?(skill.item_name.downcase)
    else
      return @proficiency.include?(skill.downcase)
    end
  end

  def is_expert(skill)
    return @expertise.include?(skill.downcase)
  end

  def to_string()
    return "Name: #{@character_name}
      Race: #{@race}
      Class: #{@character_class}
      Strength: #{@strength}
      Constitution: #{@constitution}
      Dexterity: #{@dexterity}
      Intelligence: #{@intelligence}
      Wisdom: #{@wisdom}
      Charisma: #{@charisma}
      Weapon: #{character_weapon.item_name}
      spells: #{list_spells()}"
  end
end
