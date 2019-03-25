class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name 
      t.integer :artist_id 
      t.string :release_date 
      t.boolean :released? 
    end 
  end
end
