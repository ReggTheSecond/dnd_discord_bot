class CommandParsingUtility
  def parse_character(command)
    return command.split("character:").last()
  end

  def parse_skill(command)
    return command.split("skill:").last().split(";").first()
  end
end
