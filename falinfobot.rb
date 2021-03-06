# This simple bot responds to every "bonobo competitors?" message with a list of competitors trying to reach the top of bonobo mountain
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['discord_api_key'], client_id: ENV['discord_client_id'], prefix: '&'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.command(:shipping, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  output = ""
  File.foreach("shipping_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:current_buy, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  output = ""
  File.foreach("current_buy.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:info, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  output = ""
  File.foreach("triplehelix_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:heroes, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  output = ""
  File.foreach("spacemarine_heroes.txt"){|line|
      output << "\n"
      output << line
  }
  event.user.pm(output)
end

bot.command(:subscribe, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  output = ""
  File.foreach("subscribe.txt"){|line|
    output << line
  }
  event.user.pm(output)
end


bot.command(:pins, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  #sends an image of "Read my Pins" by Madeleine Albright
  event.send_file(File.open('readThePins.jpg', 'r'), caption: "READ THE PINS")
end

bot.command(:super_secret_shipping_guide, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  username = event.author.display_name
  output = "Hello, I've decided to calculate your shipping cost automatically for you! Below is your shipping cost next to your username \n"
  output << username
  output << ": $"
  shipping_cost = 25 + rand(40)
  output << shipping_cost.to_s
  output << "\nPlease confirm this value with Fal later on when your orders have been confirmed and picked up from Triple Helix."
  event.user.pm(output)
end

bot.command(:help, {channels: ['#fals-wonderful-wares', '#fals-group-buys']}) do |event|
  event << "&info to get information on the group buy process"
  event << "&current_buy to get specific information about current deals and splits for the next buy!"
  event << "&shipping to get information about shipping"
  event << "&heroes to get information about the Space Marine Heroes lineup exclusive to Japan!"
  event << "&pins to remind people to read the freakin' pins"
  event << "&subscribe to figure out how to get subscribed to future events using the channel tags!"
end


=begin
Testing a pinner which should be called in to pin a message by a user in Trade_chat, and then unpin
that user's oldest pinned message in the channel.
bot.command(:pin_pls, {channels: ['#fals_wonderful_wares', '#trade_chat']}) do |event|
  event.user.await do |new_message_event|
    new_message = new_message_event.message

  end
end
=end

bot.run
