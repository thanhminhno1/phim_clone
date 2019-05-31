class CreateCategoryFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :category_films do |t|
      t.references :category
      t.references :film
      t.timestamps
    end
  end
end
