class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  