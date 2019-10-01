class Comment < ApplicationRecord
    validates :body, :user_id, :artwork_id, presence: true

    belongs_to :author,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    belongs_to :artwork,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artwork_id
end