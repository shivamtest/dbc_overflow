class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  has_secure_password

  VALID_EMAIL_REGEX =  /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true, length: {minimum: 6}


  def voted?(votable)
    get_vote(votable).present?
  end

  def get_vote(votable)
    self.votes.where(:votable_id => votable.id, :votable_type => votable.class.to_s).first
  end
end
# :action => "create", controller: "votes", :vote => {votable_id: answer.id, votable_type: "Answer", description: 1 }
