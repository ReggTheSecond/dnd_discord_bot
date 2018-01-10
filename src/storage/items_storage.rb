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

  def get_weapon(weapon)
    @weapons.each() do |thing|
      if thing.item_name.downcase == weapon.downcase
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

  def save_as_YAML()
    File.open("data/items/armour.ymal", 'w') do |file|
        file.puts YAML::dump(@armour)
    end
  end
end
