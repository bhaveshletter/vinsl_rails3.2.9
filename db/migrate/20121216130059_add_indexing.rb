class AddIndexing < ActiveRecord::Migration
  def change
    add_index :albums, :user_id
    add_index :photos, :album_id
  end
end
