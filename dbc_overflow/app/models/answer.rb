class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :content, :question_id, :user_id

  validates :content, :question_id, :user_id, presence: true
  validates :content, length: { minimum: 15 }
end
