require_relative '../classes/dnd_class.rb'
require_relative '../spells/spell.rb'
require "yaml"

class ClassStorage
  attr_accessor :path
  attr_accessor :files
  attr_accessor :classes

  def initialize()
    @classes = Array.new()
    @path = "data/classes/"
    @files = Dir.glob("#{@path}*.yaml")
    @files.each do |file|
      dnd_class = DnDClass.new()
      dnd_class = load_classes_as_YAML(file.split("/").last().split(".").first())
      @classes << dnd_class
    end
  end

  def save_dnd_class_as_YAML(dnd_class)
    File.open("data/classes/#{dnd_class.dnd_class_name}.yaml", 'w') do |file|
        file.puts YAML::dump(dnd_class)
    end
  end

  def load_classes_as_YAML(file)
    return YAML.load_file("data/classes/#{file}.yaml")
  end
end

thing = ClassStorage.new()

puts thing.classes[0].class_name
puts thing.classes[1].class_name
