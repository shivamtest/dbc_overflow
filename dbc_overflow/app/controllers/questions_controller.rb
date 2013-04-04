class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    redirect_to root_path, :notice => "Please Signup/Login" unless signed_in?
    @question = Question.new
  end

  def create
    @user = User.find(session[:user_id])
    @question = Question.new(params[:question])
    @question.user_id = @user.id
    if @question.save
      redirect_to @question
    else
      render :new, :notice => "Invalid submission. Try again"
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers= @question.answers
    @answer = Answer.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
