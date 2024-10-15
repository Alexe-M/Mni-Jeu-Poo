
class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name 
    @life_points = 10
  end

  def show_state  #crée une méthode qui permette d'afficher l'état de l'objet Player sur laquelle elle est exécutée
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_received) #crée une méthode qui permette de faire baisser le niveau de vie du joueur.
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)   #crée une méthode qui permette de faire qu'un joueur attaque un autre.
    puts "#{@name} attaque le joueur #{player.name}"    # @name fait référence au joueur courant (l'attaquant), car dans une méthode d'instance, @name se réfère à l'instance actuelle. Cela signifie que si player1 appelle player1.attacks(player2), @name sera "player1".
    damage_received = compute_damage  # appelle la méthode compute_damage
    puts  "il lui inflige #{damage_received} points de dommages"
    player.gets_damage(damage_received) # appelle la méthode gets_damage sur l'instance player (l'adversaire) pour réduire les points de vie
  end

  def compute_damage
    return rand(1..6)
  end

end
