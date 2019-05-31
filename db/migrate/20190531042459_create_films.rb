class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :country
      t.timestamps
    end
  end
end
