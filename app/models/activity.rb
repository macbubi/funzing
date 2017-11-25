class Activity < ApplicationRecord

  def self.all_active_activities
    all.where("date > ?", Time.now).where("max_attendies > current_attendies")
  end

end
