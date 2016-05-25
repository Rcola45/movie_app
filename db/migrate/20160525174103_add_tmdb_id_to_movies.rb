class AddTmdbIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :tmdb_id, :string
  end
end
