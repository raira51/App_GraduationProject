# app/controllers/flowers_controller.rb
class FlowersController < ApplicationController
  before_action :require_login
  before_action :set_celebration

  def index
    @q = params[:q].to_s.strip
    scope = Flower.order(:id)

    if @q.present?
      escaped = ActiveRecord::Base.sanitize_sql_like(@q)
      like = "%#{escaped}%"

      @flowers = scope.where(
        "name ILIKE :q OR word ILIKE :q",
        q: like
      )
    else
      @flowers = scope
    end
  end

  private

  def set_celebration
    @celebration = current_user.celebrations.find(params[:celebration_id])
  end
end
