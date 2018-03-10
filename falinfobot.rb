# This simple bot responds to every "bonobo competitors?" message with a list of competitors trying to reach the top of bonobo mountain
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['discord_api_key'], client_id: ENV['discord_client_id'], prefix: '~'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.message(with_text: 'current deals?') do |event|
  output_message = String.new("")
  File.open()
  event.respond "Current deals include buying items from Triplehelixgames.com!"
end

bot.message(with_text: 'shipping') do |event|
  output_message = String.new("")
  File.open(shipping_info.txt).each do |line|
    output_message = output_message + line
  end
  event.respond output_message
end

bot.message(with_text: '')

bot.run