require 'discordrb'
require_relative 'command_centre/command_centre.rb'
require_relative 'character/create_character_sheet.rb'

token = ARGV[0]
client_id = ARGV[2]

dnd_bot = Discordrb::Bot.new token: token, client_id: client_id

command_centre = CommandCentre.new()
character_maker = CreateCharacterSheet.new()

def remove_promt(command)
  return command.gsub("!", "").downcase.strip
end

dnd_bot.message(with_text: /^!.+/) do |event|
  command = event.content.to_s()
  event.respond command_centre.process_command(remove_promt(command))
end

dnd_bot.message(with_text: /^new character/) do |event|
  character_maker.generate(event)
end

dnd_bot.run
