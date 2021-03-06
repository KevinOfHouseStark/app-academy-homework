class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :sub
  
  belongs_to :author,
    foreign_key: :author_id, 
    class_name: :User

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :post_id
end
