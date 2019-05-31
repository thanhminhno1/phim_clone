class CategoryFilm < ApplicationRecord
  belongs_to :category
  belongs_to :film
end
