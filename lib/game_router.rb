require 'game_controller'
require 'colorize'
require 'colorized_string'
require 'rick'
class GameRouter

  def perform
    puts `clear`
    puts "BIENVENUE DANS LE TIC-TAC-TOE DE LA MUERTE (la mort en espagnol)"
    while true
      #on affiche le menu
      puts "\nTu veux te faire une partie ?"
      puts "\n1. Oui \u{1f3b0}"
      #rejouer contre le même joueur
      puts "\n2. Tu aimes les #{"surprises".blink} ? \u{1f381}" #affichage d'une page bonus
      puts "\n3. Je vous emmerde et je rentre à ma maison \u{1f3d8}"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
        puts "Ok Séraphin, tu es très très sympa alors va pour une partie.\n\n"
        @game = Game.new.play
      when 2
        Rick.new.blurp
      when 3
        Cartman.new.vous_emmerde
        break #ce "break" permet de sortir de la boucle while.
      else
        puts "Tu ne sais donc pas compter jusqu'à 3 ? #{"Try again".blink}" #si l'utilisateur saisit une entrée non prévue.
      end
    end
  end
end
