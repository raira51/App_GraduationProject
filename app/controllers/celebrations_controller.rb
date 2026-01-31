class CelebrationsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def show
    @celebration = Celebration.find_by!(share_url: params[:share_url])
  end

  def new
    @celebration = Celebration.new
  end

  def create
    @celebration = current_user.celebrations.new(celebration_params)
    @celebration.status = :draft

    if @celebration.save
      redirect_to issued_celebration_path(@celebration), notice: "お祝いルームを作成しました"
    else
      Rails.logger.debug @celebration.errors.full_messages
      render :new, status: :unprocessable_entity
  end
end


  def edit
  end

  def update
  end

  def destroy
  end

  def publish
    @celebration = current_user.celebrations.find(params[:id])
    @celebration.published!
    redirect_to mypage_path, notice: "公開しました"
  end

  def issued
    @celebration = current_user.celebrations.find(params[:id])
  end


  private

  def celebration_params
    params.require(:celebration).permit(
      :title,
      :celebration_date,
      :giver_name,
      :receiver_name,
      :short_message,
      :view_password,
    )
  end
end
