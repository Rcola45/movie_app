class RenameActorToCast < ActiveRecord::Migration
  def change
    rename_table :actors, :cast
  end
end
