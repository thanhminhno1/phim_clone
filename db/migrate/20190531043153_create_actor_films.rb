class CreateActorFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_films do |t|
      t.references :actor
      t.references :film
      t.timestamps
    end
  end
end
