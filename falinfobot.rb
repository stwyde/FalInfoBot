# This simple bot responds to every "bonobo competitors?" message with a list of competitors trying to reach the top of bonobo mountain
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['discord_api_key'], client_id: ENV['discord_client_id'], prefix: '~'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.command :shipping do |event|
  output = ""
  File.foreach("shipping_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command :current_buy do |event|
  output = ""
  File.foreach("current_buy.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command :info do |event|
  output = ""
  File.foreach("triplehelix_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end


bot.command :heroes do |event|
  output = ""
  File.foreach("spacemarine_heroes.txt"){|line|
      output << "\n"
      output << line
  }
  event.user.pm(output)
end

bot.command :pins do |event|
  #sends an image of "Read my Pins" by Madeleine Albright
  event.send_file(File.open('readThePins.jpg', 'r'), caption: "READ THE PINS")
end

bot.command :help do |event|
  event << "~info to get information on the group buy process"
  event << "~current_buy to get specific information about current deals and splits for the next buy!"
  event << "~shipping to get information about shipping"
  event << "~heroes to get information about the Space Marine Heroes lineup exclusive to Japan!"
  event << "~pins to remind people to read the freakin' pins"
end
bot.message(with_text: '')

bot.run