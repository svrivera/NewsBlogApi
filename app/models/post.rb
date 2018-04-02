class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :subtitle, presence: true, length: {maximum: 200}
  validates :title, presence: true
  validates :body, presence: true
end
