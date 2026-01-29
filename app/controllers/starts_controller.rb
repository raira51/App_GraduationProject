class StartsController < ApplicationController
  def show
    redirect_to new_celebration_path if logged_in?
  end
end
