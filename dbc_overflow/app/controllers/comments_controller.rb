class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = session[:user_id]
    
    case params[:comment][:commentable_type]
      when "Answer"
        if @comment.save
          answer = Answer.find(@comment.commentable_id)
          redirect_to(answer.question)
        else
          answer = Answer.find(@comment.commentable_id)
          flash[:notice] = "Answer comment needs some CONTENT"
          redirect_to answer.question
        end

      when "Question"
        question = Question.find(params[:comment][:commentable_id])
        if @comment.save
          redirect_to(question)
        else
          flash[:notice] = "Question comment needs some Content"
          redirect_to(question)
        end
      end
  
  end

end
