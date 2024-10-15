require "pry"

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

class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    super(name)   #Appel à la méthode initialize de la classe mère Player
    @life_points = 100  # Redéfinir les points de vie pour les joueurs humains
    @weapon_level = 1   # Les joueurs humains ont un niveau d'arme de 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * weapon_level
  end

  def search_weapon   #crée une méthode qui permette de chercher une nouvelle arme
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack  #crée une méthode qui permette de chercher des packs de points de vie
    pack_nbr = rand(1..6)
    if pack_nbr == 1 
      puts "Tu n'as rien trouvé... "
    elsif 2 <= pack_nbr && pack_nbr <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      @life_points = 100 if @life_points > 100
    elsif pack_nbr == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      @life_points = 100 if @life_points > 100
    end
  end
      

end


