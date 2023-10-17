# Classe représentant un joueur
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end
  
  def show_state()
    puts ">> Le joueur #{self.name} a actuellement #{self.life_points}PVs."
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      @life_points = 0
      return puts ">> Le joueur #{self.name} n'a plus de PVs! Il a été tué.\n>> Rest In Pieces dear #{self.name} !"
    end
    puts ">> Le joueur #{self.name} a actuellement #{self.life_points}PVs."
  end

  def attacks(player)
    puts ">> #{self.name} attaque #{player.name} !"
    attack_damage = compute_damage
    puts ">> {self.name} inflige #{attack_damage} point(s) de dégât(s) à #{player.name} !"
    player.gets_damage(attack_damage)
  end

  def compute_damage
    return rand(1..6)
  end
end #ferme la classe Player