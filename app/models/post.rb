# app/models/post.rb
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_many :upvotes
  has_many :downvotes

  validates :title, presence: true
  validates :content, presence: true
end
