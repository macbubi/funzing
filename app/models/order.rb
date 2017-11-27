class Order < ApplicationRecord

  belongs_to :activity
  belongs_to :user
  # validates_associated :activity
  # validates_associated :user
  validates :tickets, numericality: { only_integer: true }
  validate :validate_number_of_tickets

  before_save :set_total_price


  def validate_number_of_tickets
    errors.add(:tickets, "There are no #{tickets} tickets available, tickets available: #{activity.available_tickets}") if activity.available_tickets < tickets
  end

  def set_total_price
    # here we will add discount in the future
    self.total_price = tickets * activity.price
  end

end
