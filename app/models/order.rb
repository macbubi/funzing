class Order < ApplicationRecord
  # relations
  belongs_to :activity
  belongs_to :user
  # validations
  validates :tickets, numericality: { only_integer: true }
  validate :validate_number_of_tickets
  # callbacks
  before_save :set_total_price
  after_save :update_current_attendies


  def validate_number_of_tickets
    errors.add(:tickets, "There are no #{tickets} tickets available, tickets available: #{activity.available_tickets}") if activity.available_tickets < tickets
  end

  def set_total_price
    # total price may be different from tickets * activity.price when adding discounts in the future
    self.total_price = tickets * activity.price
  end

  def update_current_attendies
    new_attendies = activity.current_attendies + tickets
    activity.update_attribute(:current_attendies, new_attendies)
  end

end
