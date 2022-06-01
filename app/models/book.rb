class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { in: 1..200 }
end
