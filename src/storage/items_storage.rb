require_relative '../items/item.rb'
require_relative '../items/currency.rb'
require_relative '../items/weapon.rb'
require_relative '../items/armour.rb'
require "yaml"

class ItemsControl
  attr_accessor :items
  attr_accessor :weapons
  attr_accessor :armour

  def initialize()
    @items = Array.new()
    @weapons = Array.new()
    @armour = Array.new()

    load_all_from_YAML()
  end

  def load_all_from_YAML()
    load_items()
    load_weapons()
    load_armour()
  end
  def load_items()
    @items = YAML.load_file("data/items/items.yaml")
  end

  def load_weapons()
    @weapons = YAML.load_file("data/items/weapons.yaml")
  end

  def load_armour()
    @armour = YAML.load_file("data/items/armour.yaml")
  end

  def get_item(item)
    @items.each() do |thing|
      if thing.item_name.downcase == item.downcase
        return thing
      end
    end
  end

  def get_weapon(weapon)
    puts weapon
    @weapons.each() do |thing|
      if thing.item_name.downcase == weapon.downcase
        return thing
      end
    end
  end

  def get_armour(armour)
    @armour.each() do |thing|
      if thing.item_name.downcase == armour.downcase
        return thing
      end
    end
  end

  def to_bool(convet)
    if convet.strip() == "true"
      return true
    elsif convet.strip() == "false"
      return false
    else
      return convet
    end
  end

  def items_to_string()
    items = ""
    @items.each() do |item|
      items << "#{item.to_string()}\n\n"
    end
    return items
  end

  def weapons_to_string()
    weapons = ""
    @weapons.each() do |weapon|
      weapons << "#{weapon.to_string()}\n\n"
    end
    return weapons
  end

  def armour_to_string()
    armours = ""
    @armour.each() do |armour|
      armours << "#{armour.to_string()}\n\n"
    end
    return armours
  end

  def load_all_from_YAML()
    load_items()
    load_weapons()
    load_armour()
  end

  def save_all_as_YAML()
    save_items_as_YAML()
    save_weapon_as_YAML()
    save_armour_as_YAML()
  end

  def save_items_as_YAML()
    File.open("data/items/items.yaml", 'w') do |file|
        file.puts YAML::dump(@items)
    end
  end

  def save_weapon_as_YAML()
    File.open("data/items/weapons.yaml", 'w') do |file|
        file.puts YAML::dump(@weapons)
    end
  end

  def save_armour_as_YAML()
    File.open("data/items/armour.yaml", 'w') do |file|
        file.puts YAML::dump(@armour)
    end
  end
end

# item_storage = ItemsControl.new()
# item = Item.new()
# weapon = Weapon.new()
# armour = Armour.new()
#
# item.item_name = "Bag of Tricks"
# item.item_type = "Wonderous"
# item.item_decription = ""
# item.cost = 5
# item.weight = 1
# item.magical = true
# puts item.to_string()

# weapon.item_name = "Spear"
# item.item_type = ""
# weapon.item_decription = "It is like a stick, with a pointy bit, and you can stab people with it or you can like, you know, throw it."
# weapon.cost = 155
# weapon.weight = 3
# weapon.magical = false
# weapon.damage_die = "1d6"
# weapon.finesse = false
# weapon.heavy = false
# weapon.light = false
# weapon.loading = false
# weapon.short_range = 30
# weapon.long_range = 60
# weapon.reach = false
# weapon.special = false
# weapon.ranged = true
# weapon.ammunition = false
# weapon.thrown = true
# weapon.two_handed = false
# weapon.versatile = false
# weapon.proficiency_required = false
# puts weapon.to_string

# armour.item_name = "Chain Mail"
# item.item_type = ""
# armour.item_decription = "Made of interlocking metal rings, chain mail includes a layer of quilted fabric worn underneath the mail to prevent chafing and to cushion the impact of blows. The suit includes gauntlets."
# armour.cost = 500
# armour.weight = 55
# armour.magical = false
# armour.armour_type = "Heavy"
# armour.armor_class = 16
# armour.strength_required = 0
# armour.stealth = true

# item_storage.items << item
# item_storage.weapons << weapon
# item_storage.armour << armour
# item_storage.save_all_as_YAML()
