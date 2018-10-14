class ControlController < ApplicationController
  def index
    @devices = Device.all
  end

  def get_device
    device = Device.includes(:status).find_by(id: params[:id])
    render json: { 'device': device, 'status': device.status }
  end

  def create_command
    command = Command.create(device_id: params[:device_id], code: params[:code], action: params[:action_type], command: params[:command])
    render json: { 'command': command }
  end
end
