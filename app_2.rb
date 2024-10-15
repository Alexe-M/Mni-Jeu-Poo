require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_2'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Initialisation du joueur
puts "Quel est ton prénom?"
print ">"
user_name = gets.chomp
user = HumanPlayer.new(user_name)


# Initialisation des ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]
puts "-------------------------------------------------"
puts "Ok #{user.name} tu combattras #{player1.name} et #{player2.name}!"
puts "-------------------------------------------------"


# Phase de combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  # Vérifie que le user 1 et player 1 ou player 2 ont toujours des points de vie. La boucle while s'arrête si l'une des conditions devient fausse"
  puts "#{user.name} tu as #{user.life_points} points de vie"
  gets.chomp
  puts "-------------------------------------------------"
  
  
  # Mise en place du menu et ses options pour le joueur
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  if player1.life_points > 0
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"   # Comment empêcher "0" d'être sélectionné quand le if n'est pas respecté?
  end
  if player2.life_points > 0
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
  end
  print ">"
  response = gets.chomp

  if response == "a"
    puts "-------------------------------------------------"
    puts "Tu as choisi une meilleure arme"
    puts "-------------------------------------------------"
    user.search_weapon
  elsif response == "s"
    puts "-------------------------------------------------"
    puts "Tu as choisi de te soigner"
    puts "-------------------------------------------------"
    user.search_health_pack
  elsif response == "0"
    if player1.life_points > 0
      puts "-------------------------------------------------"
      puts "Tu as choisi d'attaquer #{player1.name}"
      user.attacks(player1)
    else
      puts "#{player1.name} est déjà mort, tu ne peux pas l'attaquer."
    end
  elsif response == "1"
    if player2.life_points > 0
      puts "-------------------------------------------------"
      puts "Tu as choisi d'attaquer #{player2.name}"
      user.attacks(player2)
    else
      puts "#{player2.name} est déjà mort, tu ne peux pas l'attaquer."
    end
  end
  puts "-------------------------------------------------"

  gets.chomp
  
  puts "Les autres joueurs t'attaquent !"
  gets.chomp

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
  puts "-------------------------------------------------"
  gets.chomp
end 


 # Fin du jeu
puts "La partie est finie"
  if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end
  puts "-------------------------------------------------"

