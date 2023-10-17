# Classe représentant un bot
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  # ---

  def show_state
    print "~ Le joueur #{@name} a actuellement #{@life_points} PVs."
  end

  # ---

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      @life_points = 0
      puts "> Le joueur #{@name} n'a plus de PVs! Il est complètement DIE."
      puts "\n\n              Rest In Pieces dear #{@name} !"
    else
      puts "> Le joueur #{@name} n'a plus que #{@life_points}PVs.\n\n"
    end
  end

  # ---

  def attacks(player)
    puts ">>> #{@name} attaque #{player.name} !"
    attack_damage = compute_damage
    puts ">> #{@name} inflige #{attack_damage} point(s) de dégât(s) à #{player.name} !"
    player.gets_damage(attack_damage)
  end

  def compute_damage
    rand(1..6)
  end
end # ferme la classe "Player"

# --- 

# Classe représentant un joueur humain
class HumanPlayer < Player
  attr_accessor :current_weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @current_weapon_level = 1
  end

  def show_state
    print "~ Le joueur #{@name} a actuellement #{@life_points} PVs et une arme de niveau #{@current_weapon_level}."
  end

  def compute_damage
    rand(1..6) * @current_weapon_level
  end

  # ---

  def search_weapon
    found_weapon_level = rand(1..6)
    puts "\nTu cherches une nouvelle arme...\nCherche-cherche-cherche..."
    puts "\nTu as trouvé une arme de niveau #{found_weapon_level} !"

    if found_weapon_level > @current_weapon_level
      puts "\nMais elle déchire cette fourchette ! ( •_•)>⌐■-■ (⌐■_■)"
      puts "Ton arme fatale gagne #{found_weapon_level - @current_weapon_level} dents ! Ça pique sa mère !\n"
    elsif found_weapon_level == @current_weapon_level
      puts "\nDamn... elle n'est pas mieux que ton arme actuelle... ლ( `Д’ ლ)\nQue de temps et d'opportunités de perdus..."
    else
      puts "\nF@*#{$.}... elle est carrément pourrave cette arme... (╥﹏╥ )\nAllô le game-design ?!"
    end
  end

  # ---

  def search_health_pack
    search_health_pack = rand(1..6)
    puts "\nTu cherches un pack de PVs... comme si c'était normal...\nCherche-cherche-cherche..."

    if search_health_pack == 1
      puts "\nTu n'as rien trouvé (╯°□°）╯︵ ┻━┻\nRNGesus, where are you quand je need you ?!\n"
      # puts "Ton arme fatale gagne #{search_health_pack - @current_weapon_level} dents ! Ça pique sa mère !\n"
    elsif search_health_pack == 6
      puts "\nTu as trouvé un pack de +80PVs (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧ ! \nT'es vraiment trop fort maggle ! \n"
    else
      puts "\nTu as trouvé un pack de +50PVs ┏━┓ ︵ /(^.^/)! \nC'est toujours ça de pris pour un mec lambda ! \n"
    end
  end





  
end # ferme la classe "HumanPlayer"
