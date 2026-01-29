class SessionsController < ApplicationController
  def new
  end

  def create
    name = params.dig(:user, :name).to_s
    password = params.dig(:user, :password).to_s

    if login(name, password)
      redirect_to mypage_path, notice: "ログインしました"
    else
      flash.now[:alert] = "IDまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "ログアウトしました"
  end
end
