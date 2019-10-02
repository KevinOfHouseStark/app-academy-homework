# == Schema Information
#
# Table name: cats
#
#  id          :integer(8)      not null, primary key
#  birth_date  :date            not null
#  color       :string          not null
#  name        :string          not null
#  sex         :string(1)       not null
#  description :text            not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = %w(black white orange grey rainbow)

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: {in: %w(M F), message: "Sex must be M or F"}
    validates :color, inclusion: {in: COLORS, message: "Invalid color"}

    has_many :rental_requests,
        class_name: :CatRentalRequest,
        primary_key: :id,
        foreign_key: :cat_id,
        dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end
end

