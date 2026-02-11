class PublicCelebrationsController < ApplicationController
  def show
    @celebration = Celebration.find_by!(share_url: params[:share_url])
    raise ActiveRecord::RecordNotFound unless @celebration.published?
  end

  def bouquet
    @celebration = Celebration.find_by!(share_url: params[:share_url])
    @bouquet = @celebration.bouquet
    @bouquet_flowers = @bouquet&.bouquet_flowers&.includes(:flower) || []
  end

  def letters
  @celebration = Celebration.find_by!(share_url: params[:share_url])
  @letters = @celebration.letters.order(created_at: :asc)
  end

  def letter
    @celebration = Celebration.find_by!(share_url: params[:share_url])
    @letter = @celebration.letters.find(params[:id])
  end
end
