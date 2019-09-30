class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  
end