class AddColumnToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :film_type, :string
    add_column :films, :year_release, :string
    add_column :films, :running_time, :string
    add_column :films, :quanlity, :string
    add_column :films, :min_age, :integer
    add_column :films, :rate, :integer
  end
end
