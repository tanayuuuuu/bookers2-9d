class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :categories, through: :book_categories, dependent: :destroy
  has_many :book_categories, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { in: 1..200 }

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :rating, -> {order(star: :desc)}
  scope :rating_bad, -> {order(star: :asc)}

  def self.search(search_word)
    Book.where(["category LIKE ?", "#{search_word}"])
  end

end
