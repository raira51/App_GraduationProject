# app/controllers/bouquet_flowers_controller.rb
class BouquetFlowersController < ApplicationController
  before_action :require_login
  before_action :set_celebration

  def create
    bouquet = @celebration.bouquet || @celebration.create_bouquet
    flower  = Flower.find(params[:flower_id])

    BouquetFlower.transaction do
      bouquet.bouquet_flowers.delete_all
      bouquet.bouquet_flowers.create!(flower_id: flower.id)
    end

    redirect_to edit_celebration_path(@celebration), 
    notice: t("bouquet_flowers.create.success", flower_name: flower.name)
  rescue ActiveRecord::RecordInvalid
    redirect_to celebration_flowers_path(@celebration), 
    alert: t("bouquet_flowers.create.failure")
  end

  private

  def set_celebration
    @celebration = current_user.celebrations.find(params[:celebration_id])
  end
end
