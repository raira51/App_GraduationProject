class LettersController < ApplicationController
  before_action :require_login
  before_action :set_celebration
  before_action :set_letter, only: %i[edit update destroy]

  def new
    @letter = @celebration.letters.new
  end

  def create
    @letter = @celebration.letters.new(letter_params)
    if @letter.save
      redirect_to edit_celebration_path(@celebration), notice: t("letters.create.added")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @letter.update(letter_params)
      redirect_to edit_celebration_path(@celebration), notice: t("letters.update.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @letter.destroy!
    redirect_to edit_celebration_path(@celebration), notice: t("letters.destroy.deleted")
  end

  private

  def set_celebration
    @celebration = current_user.celebrations.find(params[:celebration_id])
  end

  def set_letter
    @letter = @celebration.letters.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:sender_name, :body)
  end
end
