class SessionsController < ApplicationController
  def new
  end

  def create
    name = params.dig(:user, :name).to_s
    password = params.dig(:user, :password).to_s

    if login(name, password)
      redirect_to mypage_path, notice: t("sessions.create_success")
    else
      flash.now[:alert] = t("sessions.create.invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: t("sessions.destroy.logged_out")
  end
end
