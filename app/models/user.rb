class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :upvotes, -> { distinct }, through: :posts
    has_many :downvotes, -> { distinct }, through: :posts
  end
  