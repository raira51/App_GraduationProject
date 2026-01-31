class CelebrationsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def show
    @celebration = Celebration.find_by!(share_url: params[:id])
  end

  def new
    @celebration = Celebration.new
  end

  def create
    @celebration = Celebration.new(celebration_params)

    if @celebration.save
      redirect_to celebration_path(@celebration.share_url), notice: "お祝いルームを作成しました"
    else
      flash.now[:alert] = @celebration.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
