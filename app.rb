require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

player1 = Player.new("Josi_la_kikoo")
player2 = Player.new("José_la_malice")

def combat_warmup(player1, player2)
  puts "\nLadies & Gentlemen! Bienvenue pour ce combat d'anthologie qui opposera...\n"
  puts "#{player1.name}, l'indétrônable !"
  puts "VS"
  puts "#{player2.name}, l'irrésistible !"
  puts "\nVoici l'état de chaque joueur avant leur affrontement titanesque :\n"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"

  puts "\nNOooOwwW ! Let's get READYYY To RrrRRrRrRRRuuUUMMBLLLLLLLLLLLLLLLLLLLLE !"
  puts "\n\n"
end

def round_preview(player1, player2)
  puts "~~~~~~~~~~~~~~~~~~~~ NEW ROUND ~~~~~~~~~~~~~~~~~~~~"
  puts "\nVoici l'état de chaque joueur avant le round :"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts "\n"
end

def combat(player1, player2)
  while player1.life_points > 0 && player2.life_points > 0
    round_preview(player1, player2)

    player1.attacks(player2)
    break if player2.life_points <= 0 # Check if player2 is defeated after player1's attack

    player2.attacks(player1)
    break if player1.life_points <= 0 # Check if player1 is defeated after player2's attack
  end

  and_the_winner_is(player1, player2)
end

def and_the_winner_is(player1, player2)
  if player1.life_points <= 0
    puts ".#{player2.name} WINS!\n\n"
  elsif player2.life_points <= 0
    puts ".#{player1.name} WINS!\n\n"
  end
end

# round_preview(player1, player2)
combat_warmup(player1, player2)
combat(player1, player2)

# binding.pry