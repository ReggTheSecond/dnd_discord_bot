require_relative '../skills.rb'

class CommandParsingUtility
  attr_accessor :skills

  def initialize()
    @skills = Skills.new()
  end
  def parse_character(command)
    return command.split("character:").last().split(";").first
  end

  def parse_skill(command)
    skill = command.split("skill:").last().split(";").first()
    return skill
  end

  def parse_action(command)
    return command.split(";").last
  end

  def parse_spell(command)
    return command.split("spell:").last
  end

  def parse_item(command)
    return command.split("item:").last
  end

  def parse_weapon(command)
    return command.split("weapon:").last
  end

  def parse_armour(command)
    return command.split("armour:").last
  end
end
