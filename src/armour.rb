require_relative 'item.rb'

class Armour < Item
  attr_accessor :armour_type
  attr_accessor :armor_class
  attr_accessor :strength_required
  attr_accessor :stealth

  def is_light_armour()
    if @armour_type == "light"
      return "Light"
    end
  end
  def is_medium_armour()
    if @armour_type == "medium"
      return "Medium"
    end
  end
  def is_heavy_armour()
    if @armour_type == "heavy"
      return "Heavy"
    end
  end
  def disadvantage_on_stealth()
    if @stealth == true
      return "Disadvantage on Stealth"
    end
  end

  def to_string()
    from_item = super()
    to_return = "#{from_item}\nArmour Class: #{armor_class},\nArmour Type: #{is_light_armour()}#{is_medium_armour()}#{is_heavy_armour()},\nStrength Required: #{strength_required},\n#{disadvantage_on_stealth}"
    if to_return.end_with?(",")
      return to_return.chop()
    else
      return to_return
    end
  end
end
