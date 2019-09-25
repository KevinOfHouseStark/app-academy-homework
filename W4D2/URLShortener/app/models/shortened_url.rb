class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, :submitter, presence: true

    belongs_to :submitter,
        class_name: 'User'
        primary_key: :id
        foreign_key: :submitter_id
end