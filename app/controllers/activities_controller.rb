class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all_active_activities
  end

  def show
    debugger
    # @activity = Activity.find_by_id(params.id)
  end

end
