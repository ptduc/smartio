class HomeController < ApplicationController
  helper HomeHelper
  def index
    @devices = Device.joins(:status).order(:id)
  end
end
