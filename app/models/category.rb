class Category < ApplicationRecord
 
 validates :name,presence:true,length:{maxmum:50}
 has_many :books, through: :book_categories
 has_many book_categories, dependent: :destroy
end
