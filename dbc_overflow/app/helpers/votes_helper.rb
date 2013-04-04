module VotesHelper
	def find_votes(type, type_id)
	  User.find(session[:user_id]).votes.where("votable_type = ? AND votable_id = ?", type, type_id)
	end
end