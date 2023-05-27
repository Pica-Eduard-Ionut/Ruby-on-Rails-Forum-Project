class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :category
  has_many :comments, dependent: :destroy
end
