class MypagesController < ApplicationController
  before_action :require_login

  def show
    @celebrations = current_user.celebrations.order(created_at: :desc)
    @draft_celebrations = @celebrations.draft
    @published_celebrations = @celebrations.published
  end
end
