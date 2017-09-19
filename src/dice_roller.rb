class DiceRoller
  def roll_stat()
    rnd = Random.new()
    stats = Array.new()
    stats = [rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6)]
    stats = stats.sort()
    return (stats[3] + stats[2] + stats[1])
  end

  def roll_skill(character, skill)
    rnd = Random.new()
    if character.is_proficient(skill)
      if character.is_expert(skill)
        roll_total = rnd.rand(1..20) + (character.proficiency_bonus() * 2) + character.attribute_bonus(skill)
      else
        roll_total = rnd.rand(1..20) + character.proficiency_bonus() + character.attribute_bonus(skill)
      end
    else
      roll_total = rnd.rand(1..20) + character.attribute_bonus(skill)
    end
    return roll_total
  end

  def roll_attack(character)
    rnd = Random.new()
    if character.is_proficient(character.weapon_slot_one)
      roll_total = rnd.rand(1..20) + character.proficiency_bonus() + character.attack_attribute(@weapon_slot_one)
    else
      roll_total = rnd.rand(1..20) + character.attack_attribute()
    end
    return roll_total
  end

  def roll_saving_throw(character, saving_attribute)
    rnd = Random.new()
    if character.is_proficient(saving_attribute)
      roll_total = rnd.rand(1..20) + character.proficiency_bonus() + character.get_attribute(saving_attribute)
    else
      roll_total = rnd.rand(1..20) + character.get_attribute(saving_attribute)
    end
    return roll_total
  end

  def roll_damage(character, attack)
    rnd = Random.new()
    if weapon_used()
      return (character.weapon_slot_one.number_of_die() * rnd.rand(1..character.weapon_slot_one.get_dice_type()))
    elsif spell_used()
    end
  end

  def roll_stat()
    rnd = Random.new()
    stats = Array.new()
    stats = [rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6)]
    stats = stats.sort()
    return (stats[3] + stats[2] + stats[1])
  end
end
