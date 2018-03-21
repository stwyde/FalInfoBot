# This simple bot responds to every "bonobo competitors?" message with a list of competitors trying to reach the top of bonobo mountain
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: ENV['discord_api_key'], client_id: ENV['discord_client_id'], prefix: '~'

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

subbed_users = Array.new

bot.command(:subscribe, {channels: ['#fals-wonderful-wares']})  do |event|
  subbed_users << event.user
  event.user.pm("You have now subscribed to Fal's Group Buy posts! When additional information is made available, you'll be PMed.")
end

bot.command(:unsubscribe, {channels: ['#fals-wonderful-wares']}) do |event|
  subbed_users.delete(event.user)
  event.user.pm("You are now unsubscribed.")
end

#sends out a PM to everyone subscribed
bot.command(:alert, {channels: ['#fals-wonderful-wares'], required_roles: ["Really fuckin' good boi, bearer of the thrice blessed voice, seller of plastic crack"]}) do |event|
  message = event.message
  for subscriber in subbed_users:
    subscriber.pm(message)
  end
  event << "Subscribers have been PMed"
end

bot.command(:shipping, {channels: ['#fals-wonderful-wares']}) do |event|
  output = ""
  File.foreach("shipping_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:current_buy, {channels: ['#fals-wonderful-wares']}) do |event|
  output = ""
  File.foreach("current_buy.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:info, {channels: ['#fals-wonderful-wares']}) do |event|
  output = ""
  File.foreach("triplehelix_info.txt"){|line|
    output << "\n"
    output << line
  }
  event.user.pm(output)
end

bot.command(:heroes, {channels: ['#fals-wonderful-wares']}) do |event|
  output = ""
  File.foreach("spacemarine_heroes.txt"){|line|
      output << "\n"
      output << line
  }
  event.user.pm(output)
end

bot.command(:pins, {channels: ['#fals-wonderful-wares']}) do |event|
  #sends an image of "Read my Pins" by Madeleine Albright
  event.send_file(File.open('readThePins.jpg', 'r'), caption: "READ THE PINS")
end

bot.command(:help, {channels: ['#fals-wonderful-wares']}) do |event|
  event << "~info to get information on the group buy process"
  event << "~current_buy to get specific information about current deals and splits for the next buy!"
  event << "~shipping to get information about shipping"
  event << "~heroes to get information about the Space Marine Heroes lineup exclusive to Japan!"
  event << "~pins to remind people to read the freakin' pins"
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