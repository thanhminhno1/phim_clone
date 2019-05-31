class Film < ApplicationRecord
  belongs_to :country
  has_many :category_films
  has_many :categories, through: :category_films
  has_many :actor_films
  has_many :actors, through: :actor_films
  has_one_attached :image
end
