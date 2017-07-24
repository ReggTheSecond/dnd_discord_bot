require_relative 'item.rb'

class Armour < Item
  attr_accessor :armour_type
  attr_accessor :Armor_Class
  attr_accessor :strength_required
  attr_accessor :stealth

  def is_light_armour()
    if armour_type == "light"
      return "Light, "
    end
  end
  def is_medium_armour()
    if armour_type == "medium"
      return "Medium, "
    end
  end
  def is_heavy_armour()
    if armour_type == "heavy"
      return "Heavy, "
    end
  end
  def disadvantage_on_stealth()
    return @stealth
  end
end
