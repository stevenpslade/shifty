class Shift < ActiveRecord::Base
  belongs_to :user

  validates :start_date, presence: true
  validate :start_date_is_future
  validates :day_shift, :inclusion => {:in => [true, false], message: "or Night Shift must be specified."}
  validates :pending, :inclusion => {:in => [true, false]}

  protected

  def start_date_is_future
    if start_date.present?
      errors.add(:start_date, "should be in the future") if start_date < Date.today
    end
  end
end
