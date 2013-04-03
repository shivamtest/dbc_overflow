class User < ActiveRecord::Base
  has_many :questions
  has_many :answers


  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  has_secure_password

  VALID_EMAIL_REGEX =  /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true, length: {minimum: 6}
end
