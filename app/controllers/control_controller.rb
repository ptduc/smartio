class ControlController < ApplicationController
  def index
    @devices = Device.all
  end

  def get_device
    device = Device.find_by(id: params[:id])
    render json: { 'device': device }
  end

  def create_command
    command = Command.create(code: params[:code], action: params[:action_type], command: params[:command])
    render json: { 'command': command }
  end
end
