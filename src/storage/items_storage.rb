require_relative '../items/item.rb'
require_relative '../items/currency.rb'
require_relative '../items/weapon.rb'
require_relative '../items/armour.rb'

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
    items_list = File.open("data/items/items.csv", 'r')
    items_list.each() do |line|
      new_item = Item.new()
      item_details = line.split("~")
      item_details.each() do |detail|
        if detail.include?("item_name")
          new_item.item_name = detail.split("=").last()
        elsif detail.include?("item_decription")
          new_item.item_decription = detail.split("=").last()
        elsif detail.include?("cost")
          new_item.cost = detail.split("=").last().to_i()
        elsif detail.include?("weight")
          new_item.weight = detail.split("=").last()
        elsif detail.include?("magical")
          new_item.magical = detail.split("=").last()
        end
      end
      @items << new_item
    end
  end

  def load_weapons()
    items_list = File.open("data/items/weapons.csv", 'r')
    items_list.each() do |line|
      new_weapon = Weapon.new()
      item_details = line.split("~")
      item_details.each() do |detail|
        if detail.include?("item_name")
          new_weapon.item_name = detail.split("=").last()
        elsif detail.include?("item_decription")
          new_weapon.item_decription = detail.split("=").last()
        elsif detail.include?("cost")
          new_weapon.cost = detail.split("=").last().to_i()
        elsif detail.include?("weight")
          new_weapon.weight = detail.split("=").last()
        elsif detail.include?("magical")
          new_weapon.magical = detail.split("=").last()
        elsif detail.include?("damage_die")
          new_weapon.damage_die = detail.split("=").last()
        elsif detail.include?("finesse")
          new_weapon.finesse = to_bool(detail.split("=").last())
        elsif detail.include?("heavy")
          new_weapon.heavy = to_bool(detail.split("=").last())
        elsif detail.include?("light")
          new_weapon.light = to_bool(detail.split("=").last())
        elsif detail.include?("loading")
          new_weapon.loading = to_bool(detail.split("=").last())
        elsif detail.include?("short_range")
          new_weapon.short_range = detail.split("=").last().to_i()
        elsif detail.include?("long_range")
          new_weapon.long_range = detail.split("=").last().to_i
        elsif detail.include?("reach")
          new_weapon.reach = to_bool(detail.split("=").last())
        elsif detail.include?("special")
          new_weapon.special = to_bool(detail.split("=").last())
        elsif detail.include?("thrown")
          new_weapon.thrown = to_bool(detail.split("=").last())
        elsif detail.include?("two_handed")
          new_weapon.two_handed = to_bool(detail.split("=").last())
        elsif detail.include?("versatile")
          new_weapon.versatile = to_bool(detail.split("=").last())
        elsif detail.include?("ammunition")
          new_weapon.ammunition = to_bool(detail.split("=").last())
        end
      end
      @weapons << new_weapon
    end
  end

  def load_armour()
    items_list = File.open("data/items/armour.csv", 'r')
    items_list.each() do |line|
      new_armour = Armour.new()
      item_details = line.split("~")
      item_details.each() do |detail|
        if detail.include?("item_name")
          new_armour.item_name = detail.split("=").last()
        elsif detail.include?("item_decription")
          new_armour.item_decription = detail.split("=").last()
        elsif detail.include?("cost")
          new_armour.cost = detail.split("=").last().to_i()
        elsif detail.include?("weight")
          new_armour.weight = detail.split("=").last()
        elsif detail.include?("magical")
          new_armour.magical = detail.split("=").last()
        elsif detail.include?("armour_class")
          new_armour.armor_class = detail.split("=").last()
        elsif detail.include?("strength")
          new_armour.strength_required = detail.split("=").last()
        elsif detail.include?("stealth")
          new_armour.stealth = to_bool(detail.split("=").last())
        elsif detail.include?("armour_type")
          new_armour.armour_type = detail.split("=").last().strip()
        end
      end
      @armour << new_armour
    end
  end

  def get_weapon(weapon)
    @weapons.each() do |thing|
      if thing.item_name == weapon
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
end

# items = ItemsControl.new
#
# puts items.items_to_string()
# puts items.weapons_to_string()
# puts items.armour_to_string()
