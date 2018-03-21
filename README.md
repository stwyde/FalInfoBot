# Fal Info Bot
Quick and dirty Ruby based Discord bot that provides information to people asking about Fal's group buy program on the r/Warhammer40k Discord channel


This bot serves a VERY simple purpose. Users can ask the bot for information, and then the bot will send that information to them via PM.

Currently this bot's main version is hosted on an Amazon Web Services t2.micro. You can use your own bot's clientId and token to host a version of this bot on your own computer!

**Software dependencies:**

* discordrb

* ruby 2.5 or higher

* Any dependencies that discordrb uses

* Libsodium is not necessary for this bot to run as there are no voice commands

**Current Commands** 


* ~help: provides a list of possible commands. This command is posted in the channel where the bot is called
* ~shipping: provides an informational response about how shipping costs are calculated
* ~current_buy: provides information about the most current group buy including anticipated due dates and ship dates
* ~heroes: provides information about space marine heroes and Fal's ability to buy sets of them while in Japan
* ~info: a generic response about what the group buy is
* ~pins: posts an image of the Read My Pins collection in the channel to remind people to read the pins

**Upcoming work**

Current future directions for this bot include allowing people to call the bot to PM someone else. This would allow Fal or someone else to simply type in "~info @personWhoDoesntReadPins" and have the bot then PM @personWhoDoesntReadPins the information given. 

Additional work on pinning and unpinning messages automatically (namely for trade_chat) would also hopefully be implemented soon. This would allow users to pin their own messages to trade chat, but would also unpin their prior posts in trade_chat as well. 
