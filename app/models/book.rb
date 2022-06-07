class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { in: 1..200 }

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :rating, -> {order(star: :desc)}
  scope :rating_bad, -> {order(star: :asc)}

end
