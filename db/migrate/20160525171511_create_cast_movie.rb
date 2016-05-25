class CreateCastMovie < ActiveRecord::Migration
  def change
    create_table :cast_movies do |t|
      t.integer :cast_id
      t.integer :movie_id
    end
  end
end
