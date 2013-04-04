class VotesController < ApplicationController

  def create
    vote = Vote.new(params[:vote])
    vote.user_id = session[:user_id]
    vote.save!
    if vote.votable_type == "answer"
      answer = Answer.find(vote.votable_id)
      question = answer.question
      redirect_to question
    else
      question = Question.find(vote.votable_id)
      redirect question
    end
  end
end
