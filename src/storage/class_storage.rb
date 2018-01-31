require_relative '../classes/dnd_class.rb'
require_relative '../classes/class_archetype.rb'
require_relative '../spells/spell.rb'
require "yaml"

class ClassStorage
  attr_accessor :path
  attr_accessor :files
  attr_accessor :classes

  def initialize()
    @classes = Array.new()
    @archetypes = Array.new()
    @classes_path = "data/classes/"
    @archetypes_path = "data/classes/archetypes/"
    @classes_files = Dir.glob("#{@classes_path}*.yaml")
    @classes_files.each do |file|
      dnd_class = DnDClass.new()
      dnd_class = load_classes_as_YAML(file.split("/").last().split(".").first())
      @classes << dnd_class
    end
    # @archetypes_files.each do |file|
    #   archetype = ClassArchetype.new()
    #   archetype = load_classes_as_YAML(file.split("/").last().split(".").first())
    #   @archetypes << dnd_class
    # end
  end

  def return_class(desired_class)
    @classes.each do |c_class|
      if c_class.class_name.downcase == desired_class.downcase
        return c_class
      end
    end
  end

  def return_archetype(desired_archetype)
      @archetypes.each do |c_archetype|
        if c_archetype.archetype_name.downcase == desired_archetype.downcase
          return c_archetype
        end
      end
  end

  def save_dnd_class_as_YAML(dnd_class)
    File.open("data/classes/#{dnd_class.class_name}.yaml", 'w') do |file|
        file.puts YAML::dump(dnd_class)
    end
  end

  def load_classes_as_YAML(dnd_class)
    return YAML.load_file("data/classes/#{dnd_class}.yaml")
  end

  def save_archetype_as_YAML(archetype)
    File.open("data/classes/#{archetype.archetype_name}.yaml", 'w') do |file|
        file.puts YAML::dump(archetype)
    end
  end

  def load_archetype_as_YAML(archetype)
    return YAML.load_file("data/classes/#{archetype}.yaml")
  end
end

# store_thing = ClassStorage.new()

# thing = DnDClass.new()
# thing.class_name = "Druid"
# thing.hit_points_at_first_level = "8 + Con"
# thing.hit_points_at_higher_levels = "1d8 + Con"
# thing.add_spell("Animate Dead")
# thing.add_spell("Arcane Eye")
#
# thing.add_proficiency("Arcana")
# thing.add_proficiency("Animal Handling")
# thing.add_proficiency("Insight")
# thing.add_proficiency("Medicine")
# thing.add_proficiency("Nature")
# thing.add_proficiency("Perception")
# thing.add_proficiency("Religion")
# thing.add_proficiency("Survival")
# thing.add_proficiency("light")
# thing.add_proficiency("medium")
#
# thing.number_of_skills_to_choose = 2
#
# thing.abilities["level 1"] = "FIRE, FIRE EVERY WHERE"
# thing.abilities["level 2"] = "ICE, ICE EVERY WHERE"
#
# puts thing.all_class_abilities()
#
# store_thing.classes << thing
# store_thing.save_dnd_class_as_YAML(thing)

# thing = ClassArchetype.new()
#
# thing.archetype_name = "Circle of Dudes"
# thing.archetype_abilities["level 1"] = "Circle of Jerks"
#
# puts thing.all_archetype_abilities()
