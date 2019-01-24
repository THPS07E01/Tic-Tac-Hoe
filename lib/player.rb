require 'game_controller'

class Player
  attr_accessor :name, :piece, :board, :board_comparison

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
    @board_comparison = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3']  # tableau utiliser pour comparer le gets.chomp et savoir s'il s'agit d'une valeur valide
  end

  def get_coordinates
    loop do
      coords = ask_for_coordinates
      if validate_coordinates(coords)
        if @board.add_piece(coords, @piece)
            # toutes les conditions précédentes ont étaient vérifiée -> break de la boucle
            break
        end
      end
    end
  end

  def ask_for_coordinates
    puts "#{@name}(#{@piece}), alors où veux tu jouer ? (écris d'abord la lettre puis le chiffre)"
    gets.chomp
  end

  def validate_coordinates(coords)
    if @board_comparison.include?(coords.downcase)
      true
    else
      puts "Tu as dû te planter #{@name}, ça ne correspond à aucun repère de la table de jeu."
    end
  end
end
