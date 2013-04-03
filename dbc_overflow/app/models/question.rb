class Question < ActiveRecord::Base
  attr_accessible :best_answer, :content, :title, :user_id

  validates :content, :title, :user_id, presence: true
  validates :title, :length => { minimum: 15, maximum: 100}
  validates :content, :length => {minimum: 100 }
end
