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
    @spells << new_spell
  end
end
