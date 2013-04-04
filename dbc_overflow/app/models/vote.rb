class Vote < ActiveRecord::Base
  attr_accessible :votable_id, :votable_type, :description, :user_id

  belongs_to :votable, :polymorphic => true
  belongs_to :user

  validates :votable_type, :votable_id, presence: true
  validates_inclusion_of :description, :in => [-1, 1]
  validates_inclusion_of :votable_type, :in => ["Answer", "Question"]



end

