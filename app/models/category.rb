class Category < ApplicationRecord
  has_many :category_films
  has_many :films, through: :category_films
end
