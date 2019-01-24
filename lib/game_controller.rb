require 'player'
require 'board'
require 'game_router'

class Game

  def initialize
    # creation de la table de jeu
    @board = Board.new

    arr_p1 = ["\u{1f479}", "\u{1f4a9}", "\u{1f47e}", "\u{1f648}", "\u{1f4a3}", "\u{1f9D5}", "\u{1f9dF}", "\u{1f98D}", "\u{1f98A}", "\u{1f42E}","\u{1f42A}", "\u{1f423}", "\u{1f413}", "\u{1f989}", "\u{1f419}", "\u{1f34C}", "\u{1f346}", "\u{1f357}", "\u{3299}", "\u{1f938}", "\u{1f3c4}", "\u{1f9df}", "\u{1f9de}", "\u{1f9dd}", "\u{1f9dc}", "\u{1f9db}", "\u{1f9d9}", "\u{1f385}", "\u{1f468}", "\u{1f921}", "\u{1f47e}", "\u{1f47b}", "\u{1f47a}", "\u{1f479}", "\u{1f47d}", "\u{1f47e}", "\u{1f916}"]
    arr_p2 = ["\u{1f354}", "\u{1f355}", "\u{1f32e}", "\u{1f35f}", "\u{1f9c0}", "\u{1f577}", "\u{1f41d}", "\u{1f41b}", "\u{1f419}", "\u{1f433}", "\u{1f422}", "\u{1f432}", "\u{1f995}", "\u{1f996}", "\u{1f989}", "\u{1f427}", "\u{1f994}", "\u{1f987}", "\u{1f984}", "\u{1f938}", "\u{1f3c4}", "\u{1f9df}", "\u{1f9de}", "\u{1f9dd}", "\u{1f9dc}", "\u{1f9db}", "\u{1f9d9}", "\u{1f385}", "\u{1f468}", "\u{1f921}", "\u{1f47e}", "\u{1f47b}", "\u{1f47a}", "\u{1f479}", "\u{1f47d}", "\u{1f47e}", "\u{1f916}"] 


    # creation des joueurs
		puts "Dans le coin gauche... This is John Cena !! Tutulutu\n\n"
    print"Non plus sérieusement quelle drôle de nom peut avoir une chipolata comme toi joueur 1 ?\n> "
    player_1 = gets.chomp
		puts "\nEt notre challenger ! L'IMPACABLE, le MAGNIFIQUE, avec 0 défaite pour 0 partie à son actif. Il s'agit de ...\n\n"
    print "Euh c'est quoi ton nom joueur 2 ?\n> "
    player_2 = gets.chomp
    puts "\nOk cette partie opposera donc #{player_1} contre #{player_2} !\n\n"
    @player_1 = Player.new(player_1, arr_p1.sample, @board)
    @player_2 = Player.new(player_2, arr_p2.sample, @board)  

    # definit le joueur qui jouera en premier
    @current_player = @player_1
  end

  def play
    loop do # boucle infinie interrompue en cas de victoire ou fin de partie
			Show.new.show_board(@board.render) # affichage de la grille de jeu
      @current_player.get_coordinates # demande au joueur le coup à jouer
			Show.new.show_board(@board.render)
      break if check_game_over	# si true met fin a la boucle et la partie se termine
      switch_players	# changement de joueur
  	end
  end

	def switch_players
    if @current_player == @player_1
        @current_player = @player_2
    else
        @current_player = @player_1
    end
  end

  def check_game_over
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?(@current_player.piece)	# verifie si il n'y a pas de combinaison gagnante
        puts "Bouyaaa #{@current_player.name}, tu l'as saucé comme jaja !"
        true	# return true dans ce cas pour mettre fin à la boucle de la def play
    else
        false
    end
  end

  def check_draw
    if @board.full?	# verifie si la table de jeu est pleine
        puts "Egalité !!"
        true	# return true dans ce cas pour mettre fin à la boucle de la def play
    else
        false
    end
  end
end
