class Skills
  attr_accessor :skills

  def initialize()
    @skills = Array.new()

    @skills << "athletics" << "acrobatics" << "slight of hand" << "stealth" << "arcana" << "history"
    @skills << "investigation" << "nature" << "religion" << "animal handeling" << "insight" << "medicine"
    @skills << "perception" << "survival" << "deception" << "intimidation" << "performance" << " persuasion"
  end

  def is_a_skill(skill)
    return @skills.include?(skill)
  end

  def attribute_for_skill(skill)
    if skill == "athletics"
      return "strength"
    elsif skill == "acrobatics" || skill == "slight of hand" || skill == "stealth"
      return "dexterity"
    elsif skill == "arcana" || skill == "history" || skill == "investigation" || skill == "nature" || skill == "religion"
      return "intelligence"
    elsif skill == "animal handeling" || skill == "insight" || skill == "medicine" || skill == "perception" || skill == "survival"
      return "wisdom"
    elsif skill == "deception" || skill == "intimidation" || skill == "performance" || skill == " persuasion"
      return "charisma"
    end
  end
end
