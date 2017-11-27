class Activity < ApplicationRecord

  def self.all_active_activities_sorted
    all.where("date > ?", Time.now).where("max_attendies > current_attendies").order("date")
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
