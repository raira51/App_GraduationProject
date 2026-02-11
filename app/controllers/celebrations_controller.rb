class CelebrationsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy publish issued]
  before_action :set_celebration, only: %i[edit update destroy publish issued]

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
      redirect_to edit_celebration_path(@celebration), notice: t("celebrations.create.redirect_to_edit")
    else
      flash.now[:alert] = @celebration.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @celebration = current_user.celebrations.find(params[:id])
    @flowers = Flower.order(:id)
    @selected_flower_ids = @celebration.bouquet&.bouquet_flowers&.pluck(:flower_id) || []
  end

  def update
    if @celebration.update(celebration_params)
      redirect_to edit_celebration_path(@celebration), notice: t("celebrations.update.saved")
    else
      flash.now[:alert] = @celebration.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @celebration.destroy!
    redirect_to mypage_path, notice: t("celebrations.destroy.deleted")
  end

  def publish
    errors = []
    errors << t("celebrations.publish.requires_letter") if @celebration.letters.none?
    bouquet_present = @celebration.bouquet&.bouquet_flowers&.any?
    errors << t("celebrations.publish.requires_bouquet") unless bouquet_present

    #if @celebration.background_type.blank?
    #errors << t("celebrations.publish.requires_background")
    #end

    if errors.any?
      redirect_to edit_celebration_path(@celebration), alert: errors
      return
    end

    @celebration.update!(status: :published)
    redirect_to issued_celebration_path(@celebration), notice: t("celebrations.publish.published")
  end

  def issued
  end

  private

  def set_celebration
    @celebration = current_user.celebrations.find(params[:id])
  end

  def celebration_params
    params.require(:celebration).permit(
      :title,
      :celebration_date,
      :giver_name,
      :receiver_name,
      :short_message,
      :view_password,
      #:background_type
    )
  end
end
