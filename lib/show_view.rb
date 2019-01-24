class View

	def create_gossip
		puts "\nQuel est ton nom petit Marcelin ?"
		user_name = gets.chomp
		puts "\nMaintenant balance-moi ton potin, des trucs sales de préférence.."
		user_gossip = gets.chomp
		return params = { author: user_name, content: user_gossip }
	end

	def index_gossips(gossips)
		i = 0
		gossips.each do |g|
			i+=1
			puts "#{i}, #{g.author} : #{g.content}"
		end
	end

	def delete_gossip(gossips)
		
		puts "\n Voici la liste des potins :"

		gossips.each_with_index do |g, i|
			puts "#{i + 1}, #{g.author} : #{g.content}"
		end

		puts "\n Quel potin veux-tu supprimer ?"
		puts gossips
		delete_gossip = gets.chomp.to_i

		File.open("db/gossip.csv", 'r').parse[delete_gossip - 1] = nil
	  

	end

end