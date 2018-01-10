require_relative 'dice_roller_utility.rb'
require_relative '../storage/items_storage.rb'

class DiceRoller < DiceRollerUtility
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
    if character.is_proficient(character.character_weapon)
      roll_total = rnd.rand(1..20) + character.proficiency_bonus() + character.attack_attribute()
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

  def roll_weapon_damage(character)
    rnd = Random.new()
    return (character.character_weapon.number_of_die().to_i * rnd.rand(1..character.character_weapon.get_dice_type().to_i)) + character.attack_attribute()
  end

  def roll_stat()
    rnd = Random.new()
    stats = Array.new()
    stats = [rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6),rnd.rand(1..6)]
    stats = stats.sort()
    return (stats[3] + stats[2] + stats[1])
  end
end
