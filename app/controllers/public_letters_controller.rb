class PublicLettersController < ApplicationController

  def new
    @celebration = Celebration.find_by!(share_url: params[:share_url])
    @letter = @celebration.letters.new
    @post_url = request.original_url
  end

  def create
    @celebration = Celebration.find_by!(share_url: params[:share_url])
    @letter = @celebration.letters.new(letter_params)

    if @letter.save
        redirect_to public_celebration_path(@celebration.share_url), notice: "送信しました"
      else
        flash.now[:alert] = @letter.errors.full_messages
        render :new, status: :unprocessable_entity
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:sender_name, :body)
  end
end
