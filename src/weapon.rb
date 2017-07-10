require_relative 'item.rb'

class Weapon < Item
  attr_accessor :damage_die
  attr_accessor :finesse
  attr_accessor :heavy
  attr_accessor :light
  attr_accessor :loading
  attr_accessor :range
  attr_accessor :reach
  attr_accessor :special
  attr_accessor :thrown
  attr_accessor :two_handed
  attr_accessor :versatile

  def set_special(special)
    if special == lance || special == net
      @special = special
    end
  end
end
