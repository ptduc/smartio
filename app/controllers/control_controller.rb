class ControlController < ApplicationController
  include ControlHelper
  def index
    @devices = Device.all
  end

  def get_device
    device = Device.includes(:status).find_by(id: params[:id])
    render json: { 'device': device, 'status': device.status }
  end

  def create_command
    cmd = Command.create(device_id: params[:device_id], code: params[:code], action: params[:action_type], command: params[:command])
    mqtt_publish("lamp/#{cmd['code']}", cmd['command'])
    render json: { 'command': cmd }
  end
end
