class EditArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :title, :string, null: false
    add_column :artworks, :image_url, :string, null: false
    add_column :artworks, :artist_id, :integer, null: false
    
    add_timestamps(:artworks)

    add_index :artworks, :artist_id
    add_index :artworks, :image_url, unique: true
    add_index :artworks, [:title, :artist_id], unique: true
  end
end
