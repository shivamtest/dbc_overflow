class VotesController < ApplicationController
  
  def create
    vote = Vote.new(params[:vote])
    vote.user_id = session[:user_id]
    vote.save!
    votable_question_path(vote)
  end

  def update
    vote = Vote.where(votable_id: params[:vote][:votable_id],
                      votable_type: params[:vote][:votable_type]).first
    vote.description = params[:vote][:description]
    vote.save!
    votable_question_path(vote)
  end

  private

  def votable_question_path(vote)
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