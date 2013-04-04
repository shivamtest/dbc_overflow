class ApplicationController < ActionController::Base
  include SessionsHelper
  include VotesHelper
  protect_from_forgery
  # before_filter :redirect_unless_signed_in, only: [:create]



  private 

  def redirect_unless_signed_in
    redirect_to root_path unless signed_in?
  end

  
end
