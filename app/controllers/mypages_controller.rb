class MypagesController < ApplicationController
  before_action :require_login

  def show
    @celebrations = current_user.celebrations.order(created_at: :desc)
  end
end
