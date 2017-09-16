class Proficiencies
  attr_accessor :saving_throws
  attr_accessor :weapon_types
  attr_accessor :armor_type
  attr_accessor :tools

  def initialize()
    @saving_throws = Array.new()
    @weapon_types = Array.new()
    @armor_types = Array.new()
    @tools = Array.new()

    @saving_throws << "strength" << "constitution"<< "dexterity" << "intelligence" << "wisdom" << "charisma"
    @weapon_types << "simple melee" << "martial melee" << "simple ranged" << "martial ranged"
    @armor_types << "light" << "medium" << "heavy"
    @tools << "blacksmiths tool" << "thieves tools"
  end

  def is_a_saving_throw(save)
    @saving_throws.each do |saving_throw|
      if saving_throw.include?(save)
        return true
      end
    end
    return false
  end

  def is_a_weapon_type(weapon)
    @weapon_types.each do |weapon_type|
      if weapon_type.include?(weapon)
        return true
      end
    end
    return false
  end

  def is_an_armor_type(armour)
    @armor_types.each do |armor_type|
      if armor_type.include?(armour)
        return true
      end
    end
    return false
  end

  def is_a_tools_set(tool)
    @tools.each do |tool_set|
      if tool.include?(tool_set)
        return true
      end
    end
    return false
  end
end
