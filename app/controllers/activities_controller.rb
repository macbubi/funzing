class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all_active_activities_sorted
  end

  def show
    @activity = Activity.all_active_activities_sorted.find_by_id(params[:id])
    if @activity == nil
      flash[:alert] = "There is no such activity."
      redirect_to :root
    end
  end

end
