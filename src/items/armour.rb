require_relative 'item.rb'

class Armour < Item
  attr_accessor :armour_type
  attr_accessor :armor_class
  attr_accessor :strength_required
  attr_accessor :stealth

  def get_armour_type()
    if @armour_type.downcase() == "light"
      return "Light"
    elsif @armour_type.downcase() == "medium"
      return "Medium"
    elsif @armour_type.downcase() == "heavy"
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
    to_return = "#{from_item}\nArmour Class: #{armor_class},\nArmour Type: #{get_armour_type()},\nStrength Required: #{strength_required},\n#{disadvantage_on_stealth}"
    if to_return.end_with?(",")
      return to_return.chop()
    else
      return to_return
    end
  end
end
