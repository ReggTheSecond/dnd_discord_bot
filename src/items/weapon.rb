require_relative 'item.rb'

class Weapon < Item
  attr_accessor :damage_die
  attr_accessor :finesse
  attr_accessor :heavy
  attr_accessor :light
  attr_accessor :loading
  attr_accessor :short_range
  attr_accessor :long_range
  attr_accessor :reach
  attr_accessor :special
  attr_accessor :ammunition
  attr_accessor :thrown
  attr_accessor :two_handed
  attr_accessor :versatile
  attr_accessor :proficiency_required

  def initialize()
    super()
  end

  def set_weapon(name)

  end

  def get_dice_type()
    return @damage_die.split("d").last()
  end

  def number_of_die()
    return @damage_die.split("d").first()
  end

  def is_finesse()
    if @finesse
      return " Finesse,"
    end
  end

  def is_heavy()
    if @heavy
      return " Heavy,"
    end
  end

  def is_light()
    if @light
      return " Light,"
    end
  end

  def is_loading()
    if @loading
      return " Loading,"
    end
  end

  def is_reach()
    if @reach
      return " Reach,"
    end
  end

  def is_special()
    if @special
      return " Special,"
    end
  end

  def is_ammunition()
    if @ammunition
      return  " Ammunition (range#{@short_range}/#{@long_range}),"
    end
  end

  def is_thrown()
    if @thrown
      return " Thrown (range#{@short_range}/#{@long_range}),"
    end
  end

  def is_two_handed()
    if @two_handed
      return " Two-Handed,"
    end
  end

  def is_versatile()
    if @versatile
      return " Versatile,"
    end
  end

  def to_string()
    from_item = super()
    to_return = "#{from_item}\nDamage:#{@damage_die}\nProperties:#{is_finesse()}#{is_heavy()}#{is_light()}#{is_loading()}#{is_reach()}#{is_special()}#{is_ammunition()}#{is_thrown()}#{is_two_handed()}#{is_versatile()}"
    if to_return.end_with?(",")
      return to_return.chop()
    else
      return to_return
    end
  end
end
