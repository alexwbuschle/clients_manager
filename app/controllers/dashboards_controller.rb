class DashboardsController < ApplicationController
  def index
    return redirect_to contacts_path if user_signed_in?
    redirect_to '/users/sign_in'
  end

  def show
  end
end
