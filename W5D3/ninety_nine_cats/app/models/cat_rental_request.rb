class CatRentalRequest < ApplicationController
    validates :cat_id, :end_date, :start_date, :status, presence: true
    validates :status, inclusion: {in: %w(PENDING APPROVED DENIED), message: "Invalid status"}
    validate :does_not_overlap_approved_request

    belongs_to :cat,
        class_name: :Cat,
        primary_key: :id,
        foreign_key: :cat_id

    def overlapping_requests
        CatRentalRequest
            .where(cat_id: cat_id)
            .where.not(id: self.id)
            .where.not('end_date < :start_date OR start_date > :end_date', start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status = \'APPROVED\'')
    end
        
    def does_not_overlap_approved_request
        overlapping_approved_requests.empty?
    end
end