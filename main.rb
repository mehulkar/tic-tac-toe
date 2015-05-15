Dir["./lib/*.rb"].each {|file| require file }

puts "Hello, What is your name?"
player = Player.new(name: gets)

# initialize computer player
computer = ComputerPlayer.new

puts "Would you like to go first? (Y/N)"
wants_to_go_first = gets

game = if wants_to_go_first == 'Y'
  Game.new(player, computer)
elsif wants_to_go_first == 'N'
  Game.new(computer, player)
else
  puts "Invalid option. Computer will go first"
  Game.new(computer, player)
end



until game.over?
  game.play(gets)
  game.auto_play
end