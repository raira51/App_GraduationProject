class CelebrationsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
end
