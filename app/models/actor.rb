class Actor < ApplicationRecord
  has_many :actor_films
  has_many :films, through: :actor_films
end
