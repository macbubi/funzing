class Activity < ApplicationRecord

  belongs_to :order

  def self.all_active_activities
    all.where("date > ?", Time.now).where("max_attendies > current_attendies")
  end

  def available_tickets
    max_attendies - current_attendies
  end

  def date_formatted
    date.strftime("%d.%m.%Y %H:%M %p")
  end

  def price_with_text
    "#{price}$ per ticket"
  end

end
