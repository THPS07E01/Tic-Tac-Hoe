require 'view'
require 'router.rb'

class Controller

	def initialize
		@view = View.new
	end

	def create_gossip
		params = @view.create_gossip
		gossip = Gossip.new(params[:author], params[:content])
		gossip.save
	end

	def index_gossips
		@view.index_gossips(Gossip.all)
	end

	def delete_gossip
		@view.delete_gossip(Gossip.all)
	end
end