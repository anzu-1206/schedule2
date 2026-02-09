class Newdate < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :startday, presence: true
    validates :endday, presence: true

    validate :expiration_date_cannot_be_in_the_past
    def expiration_date_cannot_be_in_the_past
        return if startday.blank? || endday.blank?
        if endday < startday
        errors.add(:endday, "は開始日より前の日付は使えません")
        end
    end

    validates :memo, length: { maximum: 500 }
end
