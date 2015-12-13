class DashboardsController < ApplicationController
  def index
    redirect_to dashboards_path if user_signed_in?
  end

  def show
  end
end
