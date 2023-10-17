require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

# player1 = Player.new("Grand_père_Yves_AKA_la_taffiole")
# player2 = Player.new("Grand_mère_Josette_AKA_la_véhemante")
player1 = HumanPlayer.new("Ta Brute surpuissante")
player2 = Player.new("Grand-père Yves dit 'la_taffiole'")
player3 = Player.new("Grand-mère Josette dite 'l'agressive'")
player4 = Player.new("Oncle_Pascal_AKA_le_bourrin")
player5 = Player.new("Cousin_Jean-Michel_AKA_le_boulet")
player6 = Player.new("Belle_soeur_Marie-Antoinette_AKA_la_bourge")

def welcome_screen
  puts "\n\n"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "           |  Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "           |             (PEGI 13 ans et demis)              |"
  puts "           |_________________________________________________|"
  puts "           |  Le but du jeu est de tous bien les niquer !    |"
  puts "           |      On va voir si t'en as dans le futal !      |"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

# ---

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

# ---

def round_preview(player1, player2)
  puts "           ~~~~~~~~~~~~~~~~~~~~ NEW ROUND !~~~~~~~~~~~~~~~~~~~~"
  puts "\n"
  puts "Q( *.*)D                                                          Q(0_0 Q)"
  puts "\n"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

  puts "\nVoici l'état de chaque joueur avant le round :"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"

  puts "\n\n"
  puts "               ~~~~~~~~~~~~~~~~~~ FIGHT !~~~~~~~~~~~~~~~~~~"
  puts "\n"
  puts "                      Q( *.*)=D    <<=(0_0 Q) "
  puts "\n"
  puts "               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
end

# ---

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

# ---

def and_the_winner_is(player1, player2)
  if player1.life_points <= 0
    puts "\n             Ƹ̵̡Ӝ̵̨̄Ʒ #{player2.name} WINS! Ƹ̵̡Ӝ̵̨̄Ʒ\n\n"
  elsif player2.life_points <= 0
    puts "\n             Ƹ̵̡Ӝ̵̨̄Ʒ #{player1.name} WINS! Ƹ̵̡Ӝ̵̨̄Ʒ\n\n"
  end
  puts "                               ¯\\_(ツ)_/¯\n\n" 
end

# round_preview(player1, player2)
welcome_screen
combat_warmup(player1, player2)
combat(player1, player2)

# binding.pry
