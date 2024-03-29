module VotesHelper
	
	def vote_button(action, name, votable, method=:post)
		button_to name,
		{ 
			:action => action, 
			:controller => "votes", 
			:vote => { 
				:votable_id => votable.id , 
				:votable_type =>  votable.class.to_s, 
				:description =>  name == "Upvote" ? 1 : -1 
			} }, method: method
	end

	 def upvote?(votable, votable_id)
  	find_votes(votable, votable_id).first.description == 1
  end

  def find_votes(votable, votable_id)
	  User.find(session[:user_id]).votes.where("votable_type = ? AND votable_id = ?", votable, votable_id)
	end
end