class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy


  def self.artworks_by_id(user_id)
    Artwork
        .left_outer_joins(:artwork_shares)
        .where('(artwork_shares.viewer_id = :user_id) OR (artworks.artist_id = :user_id)', user_id: user_id)
        .distinct
  end
end