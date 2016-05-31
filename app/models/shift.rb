class Shift < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :start_date, presence: true
  validates :day_shift, :inclusion => {:in => [true, false]}
  validate :start_date_is_future

  protected

  def start_date_is_future
    if start_date.present?
      errors.add(:start_date, "should be in the future") if start_date < Date.today
    end
  end
end
