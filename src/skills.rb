class Skills
  attr_accessor :skills
  attr_accessor :strength_based_skills
  attr_accessor :dexterity_based_skills
  attr_accessor :intelligence_based_skills
  attr_accessor :wisdom_based_skills
  attr_accessor :charisma_based_skills

  def initialize()
    @strength_based_skills = Array.new()
    @dexterity_based_skills = Array.new()
    @intelligence_based_skills = Array.new()
    @wisdom_based_skills = Array.new()
    @charisma_based_skills = Array.new()
    @skills = Array.new()

    @strength_based_skills << "athletics"
    @dexterity_based_skills << "acrobatics" << "slight of hand" << "stealth"
    @intelligence_based_skills  << "arcana" << "history" << "investigation" << "nature" << "religion"
    @wisdom_based_skills << "animal handeling" << "insight" << "medicine" << "perception" << "survival"
    @charisma_based_skills   << "deception" << "intimidation" << "performance" << " persuasion"
    @skills << @strength_based_skills << @dexterity_based_skills << @intelligence_based_skills << @wisdom_based_skills << @charisma_based_skills
  end

  def is_a_skill(skill)
    @skills.each do |skill_set|
      if skill_set.include?(skill)
        return true
      end
    end
    return false
  end

  def attribute_for_skill(skill)
    if @strength_based_skills.include?(skill)
      return "strength"
    elsif @dexterity_based_skills.include?(skill)
      return "dexterity"
    elsif @intelligence_based_skills.include?(skill)
      return "intelligence"
    elsif @wisdom_based_skills.include?(skill)
      return "wisdom"
    elsif @charisma_based_skills.include?(skill)
      return "charisma"
    end
  end
end
