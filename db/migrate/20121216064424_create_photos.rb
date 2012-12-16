class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :tag
      t.references :album
      t.add_attachment :users, :avatar
      t.timestamps
    end
  end
end
