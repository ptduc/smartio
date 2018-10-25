class ControlController < ApplicationController
  before_action :authenticate_user!
  include ControlHelper
  def index
    @unit_id = current_user.unit_id || 1
    @devices = Device.where(unit_id: @unit_id)
    @current_code = params[:code] || @devices.first&.code
    @history_logs = Device.find_by(code: @current_code).status_histories.order(created_at: :desc).page params[:page]
  end

  def get_device
    device = Device.includes(:status).find_by(code: params[:code])
    render json: { 'device': device, 'status': device&.status }
  end

  def create_command
    cmd = Command.create(device_id: params[:device_id], code: params[:code], action: params[:action_type], command: params[:command])
    mqtt_publish("lamp/#{cmd['code']}", cmd['command'])
    render json: { 'command': cmd }
  end
end
