class ControlController < ApplicationController
  def index
    @devices = Device.all
  end
end
