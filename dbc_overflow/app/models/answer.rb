class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  attr_accessible :content, :question_id, :user_id

  validates :content, :question_id, :user_id, presence: true
  validates :content, length: { minimum: 15 }

  def author?(user)
  	self.user == user
  end
end
