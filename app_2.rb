require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player_2"

# --- Création des joueurs

player1 = HumanPlayer.new("Ta Brute surpuissante")

ai_opponents_array = []

ai_opponents_array << player2 = Player.new("Grand-père Yves 'la p'tite frappe'")
ai_opponents_array << player3 = Player.new("Grand-mère Josette 'la vieille peau'")

# player4 = Player.new("Oncle_Pascal_AKA_le_bourrin")
# player5 = Player.new("Cousin_Jean-Michel_AKA_le_boulet")
# player6 = Player.new("Belle_soeur_Marie-Antoinette_AKA_la_bourge")

# --- Welcome screen

def welcome_screen
  puts "\n\n"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "           |                   Bienvenue sur                |"
  puts "           |                                                |"
  puts "           |            'ILS VEULENT TOUS MA POO'           |"
  puts "           |                       II                       |"
  puts "           |             (PEGI 15 ans et demis )            |"
  puts "           |________________________________________________|"
  puts "           |  Le but du jeu est de tous bien les niquer !   |"
  puts "           |      On va voir si t'en as dans le futal !     |"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

# --- Warmup

def combat_warmup(player1, player2, player3)
  puts "\nLadies & Gentlemen! Bienvenue pour ce combat d'anthologie qui opposera..."
  puts "\n               #{player1.name}, l'indétrônable !"
  puts "\n         ~~~~~~~~~~~~~~~~~~>  VS  <~~~~~~~~~~~~~~~~~~"
  puts "\n#{player2.name} et son acolyte #{player3.name}!"
  puts "\nVoici l'état de chaque joueur avant leur affrontement titanesque :\n\n"
  puts "\n\n#{player1.show_state}"
  puts "\n#{player2.show_state}"
  puts "#{player3.show_state}"

  puts "\nNOooOoOooOooooOOooOoOOoWwwwW ! Let's get READYYY To RrrRRrRrRRRuuUUMMBLLLLLLLLLLLLLLLLLLLLE !"
  puts "\n\n"
end

# --- Round preview

def round_preview(player1, player2, player3)
  puts "           ~~~~~~~~~~~~~~~~~~~~> NEW ROUND <~~~~~~~~~~~~~~~~~~~~"
  puts "Q( *.*)D                                                         Q(1_1 Q)  Q(0_0 Q)"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n\n"

  # puts "\nVoici l'état de chaque joueur avant le round :"
  puts "#{player1.show_state}"
  # puts "#{player2.show_state}"
  # puts "#{player3.show_state}"
  puts "\n\n"
  puts "           ~~~~~~~~~~~~~~~~~~~~~~> YOUR TURN <~~~~~~~~~~~~~~~~~~"
  puts "                                   Q( *.*)=D                     Q(1_1 Q)  Q(0_0 Q) "
  puts "           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
end

# --- Turn flow

def turn_flow(player1, player2, player3, ai_opponents_array)
  while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
    round_preview(player1, player2, player3)

    puts "\nQuelle action veux-tu effectuer ce tour-ci ?\n\n"
    puts "  A - Chercher une meilleure arme ?        1 - Attaquer #{player2.name} qui a #{player2.life_points} PVs"
    puts "  S - Chercher à te soigner ?              2 - Attaquer #{player3.name} qui a #{player3.life_points} PVs"
    puts "\n"

    print "\n> "
    input = gets.chomp
    input = input.to_s.upcase

    if input == "A" || input == "S" || input == "1" || input == "2"
      case input
      when "A"
        player1.search_weapon
      when "S"
        player1.search_health_pack
      when "1"
        player1.attacks(player2)
      when "2"
        player1.attacks(player3)
      end
    else
      puts "Sélection INVALIDE !\nT'es trop NUL donc tu passes ton tour ! \nEssaies de choisir une action VALIDE au tour prochain p'tit NOOBLARD !"
    end

    puts "\nAppuie sur 'Entrée' pour continuer et lancer le tour des bots !"
    input = gets.chomp

    puts "            ~~~~~~~~~~~~~~~~~~~~~ BOTS TURN ~~~~~~~~~~~~~~~~~~~~~"
    puts "Q( *.*)D                  <<==(1_1 Q)  <<==(0_0 Q) "
    puts "            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
    puts "C'est au tour des bots de jouer !\nIls te maravent ta sale ganache ! \nIls te lattent tes p'tites fesses !"
    puts "\n\n"

    ai_opponents_array.each_with_index do |opponent, index|
      if opponent.life_points > 0 && player1.life_points > 0
        opponent.attacks(player1)
        if index != ai_opponents_array.length - 1
          puts "Appuie sur 'Entrée' pour passer au bot suivant !"
          gets.chomp
        else
          puts "Appuie sur 'Entrée' pour passer au prochain tour !"
          gets.chomp
        end
      end
    end
  end
end

# --- Winner announcement

def and_the_winner_is(player1, player2, player3)
  if player2.life_points <= 0 && player3.life_points <= 0
    puts "\n                       Ƹ̵̡Ӝ̵̨̄Ʒ CONGRATZ, YOU WON! Ƹ̵̡Ӝ̵̨̄Ʒ\n\n"
  elsif player1.life_points <= 0
    puts "\n                       Ƹ̵̡Ӝ̵̨̄Ʒ SORRY - YOU LOSE Ƹ̵̡Ӝ̵̨̄Ʒ\n\n"
  end
  puts "                               ¯\\_(ツ)_/¯\n\n"
end

# --- Game flow

welcome_screen
combat_warmup(player1, player2, player3)
# combat(player1, player2, player3)
turn_flow(player1, player2, player3, ai_opponents_array)
and_the_winner_is(player1, player2, player3)

# ---
# ---
# ---
# ---
# ---

# --- Old Combat flow

# def combat(player1, player2, player3)
#   while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
#     round_preview(player1, player2, player3)

#     player1.attacks(player2)
#     break if player2.life_points <= 0 # Check if player2 is defeated after player1's attack

#     player2.attacks(player1)
#     break if player1.life_points <= 0 # Check if player1 is defeated after player2's attack
#   end

#   and_the_winner_is(player1, player2, player3)
# end
