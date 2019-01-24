require 'game_controller'
require 'pry'

class Board
  attr_accessor :board, :board_comparison

  def initialize
    @a1 = @a2 = @a3 = @b1 = @b2 = @b3 = @c1 = @c2 = @c3 = '  ' # attribution par defaut d'un espace aux variables d'instance
    @board = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]  # création de la table de jeu
    @board_comparison = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3'] # tableau utiliser pour comparer le gets.chomp et savoir s'il s'agit d'une valeur valide
  end

  def render
    puts `clear`
    puts "
         A   B   C
       +----+----+----+
    1  | #{@board[0]} | #{@board[3]} | #{@board[6]} |
       +----+----+----+
    2  | #{@board[1]} | #{@board[4]} | #{@board[7]} |
       +----+----+----+
    3  | #{@board[2]} | #{@board[5]} | #{@board[8]} |
       +----+----+----+
      "
  end

  def add_piece(coords, piece)
    if coordinates_available?(coords)
      @board[@board_comparison.index(coords.downcase)] = piece
      true  # si toutes les conditions précédentes sont vérifiées renvoie true sur player.rb (ligne 17)
    else
      false
    end
  end

  def coordinates_available?(coords)
    if @board[@board_comparison.index(coords.downcase)] == '  '
      true
    else
      puts "Bien essayé, petit malin mais quelqu'un à déjà joué à cet emplacement !"
    end
  end

  def winning_combination?(piece) # Si une des conditions renvoie true alors une condition de victoire est remplie
    winning_diagonal?(piece)   ||
    winning_horizontal?(piece) ||
    winning_vertical?(piece)
  end

  def winning_diagonal?(piece)
    (@board[0] == piece && @board[4] == piece && @board[8] == piece) ||
    (@board[2] == piece && @board[4] == piece && @board[6] == piece)
  end

  def winning_vertical?(piece)
    (@board[0] == piece && @board[1] == piece && @board[2] == piece) ||
    (@board[3] == piece && @board[4] == piece && @board[5] == piece) ||
    (@board[6] == piece && @board[7] == piece && @board[8] == piece)
  end

  def winning_horizontal?(piece)
    (@board[0] == piece && @board[3] == piece && @board[6] == piece) ||
    (@board[1] == piece && @board[4] == piece && @board[7] == piece) ||
    (@board[2] == piece && @board[5] == piece && @board[8] == piece)
  end

  def full?
    @board.include?('  ') ? false : true
  end
end
