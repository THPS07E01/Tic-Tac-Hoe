require 'controller.rb'

class Router

  def initialize
    @controller = Controller.new
  end #ainsi, un "Router.new" lancé par app.rb va créer automatique une instance "@controller"

  def perform #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit perform.
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    while true

      #on affiche le menu
      puts "Tu veux faire quoi BG ?"
      puts "1. Je veux créer un gossip"
      puts "2. Je veux lire tous les potins"
      puts "3. Quel potin veux-tu supprimer ?"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
      when 2
        puts "Tu as choisi de lire tous les potins"
        @controller.index_gossips
      when 3
        puts "Tu as choisi de supprimer un potin"
        @controller.delete_gossip
      when 4
        puts "À bientôt !"
        break #ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "Ce choix n'existe pas, merci de ressayer" #si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end