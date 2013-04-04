class VotesController < ApplicationController

  def create
    vote = Vote.new(params[:vote])
    vote.user_id = session[:user_id]
    vote.save!
    if vote.votable_type == "Answer"
      answer = Answer.find(vote.votable_id)
      question = answer.question
      redirect_to question
    else
      question = Question.find(vote.votable_id)
      redirect_to question
    end
  end

  def update
    puts "Weeeeeeeeeeeeeeeeeee"
    vote = Vote.find(params[:vote][:id])
    puts vote
    vote.description = params[:vote][:description]
    vote.save!
    if vote.votable_type == "Answer"
      answer = Answer.find(vote.votable_id)
      question = answer.question
      redirect_to question
    else
      question = Question.find(vote.votable_id)
      redirect_to question
    end
  end
end
