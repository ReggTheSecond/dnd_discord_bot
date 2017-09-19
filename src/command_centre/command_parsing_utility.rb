class CommandParsingUtility
  def parse_character(command)
    return command.split("character:").last().split(";").first
  end

  def parse_skill(command)
    return command.split("skill:").last().split(";").first()
  end

  def parse_action(command)
    return command.split(";").last
  end
end
