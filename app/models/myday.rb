class Myday < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_day, presence: true
  validates :end_day, presence: true
  def end_should_be_later_than_start
    if start_day!=nil&&end_day!=nil&&end_day<start_day
      errors.add(:end_day, "は開始日の後でなければなりません")
    end
  end
  validate :end_should_be_later_than_start
  validates :memo, length: {maximum: 500}
end
