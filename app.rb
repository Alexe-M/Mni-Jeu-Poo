require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Création des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "-------------------------------"
# Affichage initial de l'état des joueurs
puts "Voici l'état de chaque joueur :"
player1.show_state # Appelle la méthode show_state sur l'objet player1
player2.show_state

# Phase d'attaque
while player1.life_points > 0 && player2.life_points > 0  
  # Vérifie que le joueur 1 ET le joueur ont encore des points de vie au-dessus de 0. La boucle while se termine automatiquement lorsque l'une des deux conditions devient fausse, c'est-à-dire lorsque un des joueurs a 0 ou moins de points de vie.
  puts "-------------------------------" 
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)            # Appelle la méthode attacks sur l'objet player1, en passant player2 comme argument.
  break if player2.life_points <= 0   # Vérifie si player2 a 0 ou moins de points de vie après l'attaque.
  player2.attacks(player1)
  break if player1.life_points <= 0

  puts "-------------------------------" 
  # Affichage de l'état des joueurs après chaque phase d'attaque  
  puts "Voici l'état de nos joueurs :"
    player1.show_state
    player2.show_state
end






