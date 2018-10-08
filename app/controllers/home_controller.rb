class HomeController < ApplicationController
  def index
    @devices = Device.joins(:status).order(:id)
  end
end
