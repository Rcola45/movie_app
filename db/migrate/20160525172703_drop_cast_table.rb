class DropCastTable < ActiveRecord::Migration
  def change
    drop_table :cast
  end
end
