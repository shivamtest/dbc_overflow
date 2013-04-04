class Comment < ActiveRecord::Base
  validates :commentable_type, :presence => true
  validates :commentable_id, :presence => true
  validates :content, :presence => true
  attr_accessible :commentable_id, :commentable_type, :user_id, :content
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end
