require_relative '../spells/spells.rb'

class CharacterUtility
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

  def get_attribute_score(attribute_score)
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

  def get_attribute(attribute)
    case attribute
    when "strength"
      return @strength
    when "dexterity"
      return @dexterity
    when "constitution"
      return @constitution
    when "intelligence"
      return @intelligence
    when "wisdom"
      return @wisdom
    when "charisma"
      return @charisma
    end
  end

  def add_proficiency(proficiency)
    proficiencies = Proficiencies.new()
    if @skills.is_a_skill(proficiency.downcase)
      @proficiency << proficiency.downcase
    elsif proficiencies.is_a_weapon_type(proficiency.downcase)
      @proficiency << proficiency.downcase
    elsif proficiencies.is_an_armor_type(proficiency.downcase)
      @proficiency << proficiency.downcase
    elsif proficiencies.is_a_saving_throw(proficiency.downcase)
      @proficiency << proficiency.downcase
    elsif proficiencies.is_a_tools_set(proficiency.downcase)

    end
  end

  def add_expertise(expertise)
    if @skills.is_a_skill(expertise.downcase)
      if is_proficient(expertise)
        @expertise << expertise.downcase
      end
    end
  end

  def add_spell(new_spell)
    if @spells_storage.is_a_spell(new_spell)
      @spells << new_spell
    end
  end

  def list_spells()
    return @spells
  end

  def return_level()
    if @experience >= 300 and @experience < 900
      return "Level 2"
    elsif @experience >= 900 and @experience < 2700
      return "Level 3"
    elsif @experience >= 2700 and @experience < 6500
      return "Level 4"
    elsif @experience >= 6500 and @experience < 14000
      return "Level 5"
    elsif @experience >= 14000 and @experience < 23000
      return "Level 6"
    elsif @experience >= 23000 and @experience < 34000
      return "Level 7"
    elsif @experience >= 48000 and @experience < 64000
      return "Level 9"
    elsif @experience >= 64000 and @experience < 85000
      return "Level 10"
    elsif @experience >= 85000 and @experience < 100000
      return "Level 11"
    elsif @experience >= 100000 and @experience < 120000
      return "Level 12"
    elsif @experience >= 120000 and @experience < 140000
      return "Level 13"
    elsif @experience >= 140000 and @experience < 165000
      return "Level 14"
    elsif @experience >= 165000 and @experience < 195000
      return "Level 15"
    elsif @experience >= 195000 and @experience < 225000
      return "Level 16"
    elsif @experience >= 225000 and @experience < 265000
      return "Level 17"
    elsif @experience >= 265000 and @experience < 305000
      return "Level 18"
    elsif @experience >= 305000 and @experience < 355000
      return "Level 19"
    elsif @experience >= 355000
      return "Level 20"
    else
      return "Level 1"
    end
  end

  def generate_character_sheet()
    return "########################################################################
# Name: #{@character_name}, Race: #{@race}, Class: #{@character_class} #
# Strength Dexterity Constitution Intelligence Wisdom Charisma #
# #{@strength} #{@dexterity} #{@constitution} #{@intelligence} #{@wisdom} #{@charisma}"
  end
end
