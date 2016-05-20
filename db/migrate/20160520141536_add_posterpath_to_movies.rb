class AddPosterpathToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster_path, :string
  end
end
