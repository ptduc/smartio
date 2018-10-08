require 'socket'
require 'json'
require 'pg'
require 'byebug'

class Server
  def initialize(port)
    @server_socket = TCPServer.new port
    @db_conn_string = 'postgres://smartio:smartio@kynguyenxanh.net:5432/smartio_development'
    @db_conn = PG::Connection.new('postgres://smartio:smartio@kynguyenxanh.net:5432/smartio_development')
    @connected_clients = Hash.new
    @db_devices = db_get_list_devices

  end

  def run
    begin
      puts "Server on running"
      loop do
        Thread.start(@server_socket.accept) do |client|
          message = client.recv(2048);
          if message
            db_insert_message_log message
            puts "One device"
            data = JSON.parse(message)
            if data['ID']
              @connected_clients[data['ID']] = client
              case data['Action']
              when 0
                action_sent_command data
              when 1
                action_1 data
              when 2
                action_2 data
              when 3
                action_3 data
              when 4
                action_4 data
              when 5
                action_5 data
              else
              end
            end
          end
        end
      end
    end
  rescue
    @db_conn.close
  end

  def db_init
    @db_conn = PG::Connection.new(@db_conn_string)
  end

  def db_insert_message_log message
    db_init if @db_conn.nil?
    current_time = Time.now
    @db_conn.exec("INSERT INTO message_logs(\"content\", \"created_at\", \"updated_at\") VALUES ('#{message}','#{current_time}','#{current_time}')")
  end

  def db_insert_device code
    db_init if @db_conn.nil?
    result = @db_conn.exec("INSERT INTO devices(\"code\", \"unit_id\", \"is_active\", \"created_at\", \"updated_at\") VALUES ('#{code}', 1, '1','#{Time.now}','#{Time.now}') RETURNING * ")
    result[0]
  end

  def db_get_list_devices
    db_init if @db_conn.nil?
    @db_conn.exec("SELECT ID, CODE FROM DEVICES").to_a
  end

  def db_get_device code
    db_init if @db_conn.nil?
    @db_conn.exec("SELECT ID, CODE FROM DEVICES WHERE CODE LIKE '#{code}' ").first
  end

  def db_update_status_and_insert_status_logs(device_id = 1, data)
    if data || device_id
      current_time = Time.now
      relay1_mode = val_boolean(data["Relay_1"]["mode"])
      relay2_mode = val_boolean(data["Relay_2"]["mode"])
      relay3_mode = val_boolean(data["Relay_3"]["mode"])
      relay4_mode = val_boolean(data["Relay_4"]["mode"])
      relay1_status = val_boolean(data["Relay_1"]["status"])
      relay2_status = val_boolean(data["Relay_2"]["status"])
      relay3_status = val_boolean(data["Relay_3"]["status"])
      relay4_status = val_boolean(data["Relay_4"]["status"])
      db_init if @db_conn.nil?
      params = [device_id, relay1_status, relay1_mode, relay2_status, relay2_mode, relay3_status, relay3_mode, relay4_status, relay4_mode, current_time]
      @db_conn.exec_params("UPDATE statuses  \
                            SET \"relay1_mode\"  = $2,
                                \"relay1_status\"= $3,
                                \"relay2_mode\"  = $4,
                                \"relay2_status\"= $5,
                                \"relay3_mode\"  = $6,
                                \"relay3_status\"= $7,
                                \"relay4_mode\"  = $8,
                                \"relay4_status\"= $9,
                                \"updated_at\"    = $10
                            WHERE device_id = $1", params)
      @db_conn.exec_params("INSERT INTO status_histories(\"device_id\", \"relay1_mode\", \"relay1_status\", \"relay2_mode\", \"relay2_status\", \"relay3_mode\", \"relay3_status\",\"relay4_mode\", \"relay4_status\", \"created_at\", \"updated_at\") 
                                   VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)", params.push(current_time))
    end
  end

  def val_boolean val
    case val
    when 'off'
      false
    when 'manual'
      false
    when 'on'
      true
    when 'off'
      false
    else
      false
    end
  end

  def action_sent_command data
    device_code = data['Message']['ID']
    message = data['Message']
    @connected_clients[device_code].puts message if @connected_clients[device_code] && !message.nil?
  end

  def action_1
  end

  def action_2
  end

  def action_3
  end

  def action_4
  end

  # Bản tin định kỳ
  def action_5 data
    code = data['ID']
    device = db_get_device code
    device = db_insert_device code if device.nil?
    db_update_status_and_insert_status_logs(device["id"].to_i, data)
  end

end

Server.new(3003).run
