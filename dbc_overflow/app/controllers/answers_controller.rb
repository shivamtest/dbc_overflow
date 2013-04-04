class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    # @answer = Answer.new(params[:answer])
    @answer = @question.answers.build(params[:answer])
    user = User.find(session[:user_id])
    @answer.user_id = user.id
    if @answer.save
      render :json => {:answer => @answer}
    else
      redirect_to root_path
    end    
  end

  def destroy
  end

end

