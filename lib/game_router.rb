require 'game_controller'

class GameRouter

  def perform
    puts "BIENVENUE DANS LE TIC-TAC-TOE DE LA MUERTE (la mort en espagnol)"
    while true

      #on affiche le menu
      puts "Tu veux te faire une partie ?"
      puts "1. Oui"
      #rejouer contre le même joueur
      #affichage d'une page bonus
      puts "4. Je vous emmerde et je rentre à ma maison"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
        puts "Ok Séraphin, tu es très très sympa alors va pour une partie.\n\n"
        @game = Game.new.play
      when 4
        puts "À bientôt !"
        break #ce "break" permet de sortir de la boucle while.
      else
        puts "Ce choix n'existe pas, merci de ressayer" #si l'utilisateur saisit une entrée non prévue.
      end
    end
  end
end
