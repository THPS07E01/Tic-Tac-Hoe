require 'controller.rb'
require 'pry'

class Gossip
	attr_reader :author, :content

	def initialize(author, content)
	  @content = content
	  @author = author
	end

	def save
		gossip = File.new("db/gossip.csv", 'a')
		gossip.puts(@author + "," + @content)
	end

	def self.all
		all_gossips = []
		File.open("db/gossip.csv", 'r').each do |line|
			provisory_gossip = Gossip.new(line[/(.+)\,/].chop, line[/\,(.+)/].delete_prefix(","))
			all_gossips << provisory_gossip
		end
		return all_gossips
	end
end