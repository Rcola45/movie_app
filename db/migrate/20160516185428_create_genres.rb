class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
