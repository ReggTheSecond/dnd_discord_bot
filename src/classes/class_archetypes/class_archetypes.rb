require "yaml"

class ClassArchetypes
  attr_accessor :archetype_name
  attr_accessor :archetype_description
  attr_accessor :level_one_ability_name
  attr_accessor :level_two_ability_name
  attr_accessor :level_three_ability_name
  attr_accessor :level_four_ability_name
  attr_accessor :level_five_ability_name
  attr_accessor :level_six_ability_name
  attr_accessor :level_seven_ability_name
  attr_accessor :level_eight_ability_name
  attr_accessor :level_nine_ability_name
  attr_accessor :level_ten_ability_name
  attr_accessor :level_eleven_ability_name
  attr_accessor :level_twelve_ability_name
  attr_accessor :level_thirteen_ability_name
  attr_accessor :level_fourteen_ability_name
  attr_accessor :level_fifteen_ability_name
  attr_accessor :level_sixteen_ability_name
  attr_accessor :level_seventeen_ability_name
  attr_accessor :level_eighteen_ability_name
  attr_accessor :level_nineteen_ability_name
  attr_accessor :level_twenty_ability_name
  attr_accessor :level_one_ability_description
  attr_accessor :level_two_ability_description
  attr_accessor :level_three_ability_description
  attr_accessor :level_four_ability_description
  attr_accessor :level_five_ability_description
  attr_accessor :level_six_ability_description
  attr_accessor :level_seven_ability_description
  attr_accessor :level_eight_ability_description
  attr_accessor :level_nine_ability_description
  attr_accessor :level_ten_ability_description
  attr_accessor :level_eleven_ability_description
  attr_accessor :level_twelve_ability_description
  attr_accessor :level_thirteen_ability_description
  attr_accessor :level_fourteen_ability_description
  attr_accessor :level_fifteen_ability_description
  attr_accessor :level_sixteen_ability_description
  attr_accessor :level_seventeen_ability_description
  attr_accessor :level_eighteen_ability_description
  attr_accessor :level_nineteen_ability_description
  attr_accessor :level_twenty_ability_description

  def abilities(ability_name, ability_description)
    index = 0
    returnable = ""
    if ability_name.class.to_s == "Array"
      ability_name.each() do |name|
        returnable << "#{name}\n#{ability_description[index]}\n\n"
        index = index + 1
      end
    elsif ability_name == ""
      returnable << ""
    else
      returnable = "#{ability_name}\n#{ability_description}\n"
    end
    return returnable
  end

  def to_string()
    return "#{archetype_name}\n#{archetype_description}\n
#{abilities(level_one_ability_name, level_one_ability_description)}
#{abilities(level_two_ability_name, level_two_ability_description)}
#{abilities(level_three_ability_name, level_three_ability_description)}
#{abilities(level_six_ability_name, level_six_ability_description)}
#{abilities(level_seven_ability_name, level_seven_ability_description)}"
  end
end

# thing = ClassArchetypes.new()
# thing = YAML.load_file("data/classes/class_archetypes/school_of_evocation.yaml")
#
# puts thing.to_string
#
#
# being = ClassArchetypes.new()
# being = YAML.load_file("data/classes/class_archetypes/champion.yaml")
#
# puts being.to_string
