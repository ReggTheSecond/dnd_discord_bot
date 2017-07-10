class Character
  attr_accessor :character_name
  attr_accessor :race
  attr_accessor :character_class
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

  def initialize()
    roll_stats()
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

  def to_string()
    return "Name: #{@character_name}\nRace: #{@race}\nClass: #{@character_class}\nStrength: #{@strength}\nConstitution: #{@constitution}\nDexterity: #{@dexterity}\nIntelligence: #{@intelligence}\nWisdom: #{@wisdom}\nCharisma: #{@charisma}"
  end
end
