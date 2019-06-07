class Film < ApplicationRecord
  FILM_TYPES = [:movie, :series]
  QUANLITY_TYPES = [:HD, :CAM]

  belongs_to :country
  has_many :category_films
  has_many :categories, through: :category_films
  has_many :actor_films
  has_many :actors, through: :actor_films
  has_one_attached :image

  accepts_nested_attributes_for :category_films
end
