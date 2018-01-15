require 'discordrb'
require_relative 'command_centre/command_centre.rb'

token = ARGV[0]
client_id = ARGV[1]

bot = Discordrb::Bot.new token: token, client_id: client_id

command_centre = CommandCentre.new()

def remove_promt(command)
  return command.gsub("!", "").downcase.strip
end

bot.message(with_text: /^!.+/) do |event|
  command = event.content.to_s()
  event.respond command_centre.process_command(remove_promt(command))
end

bot.run
