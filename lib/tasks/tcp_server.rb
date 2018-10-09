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
    puts "Server on running"
    thread_sending_command
    thread_waiting_messages
    rescue Interrupt => e
      @db_conn.close
      puts "Server on stoping"
    rescue
      puts "Server has Exception"
  end

  private

  def thread_sending_command
    Thread.new do
      loop do
        commands = db_get_list_commands
        if commands.size > 0
          commands.each do |cmd|
            if @connected_clients[cmd["code"]] && !cmd["command"].nil?
              db_update_command(cmd["id"], 1)
              @connected_clients[cmd["code"]].puts JSON.parse(cmd["command"])
            end
          end
        end
        puts "#{Time.now} ---- Scan command table #{commands.size}"
        sleep 15
      end
    end
  end

  def thread_waiting_messages
    loop do
        Thread.start(@server_socket.accept) do |client|
          message = client.recv(1024);
          if message
            db_insert_message_log message
            data = JSON.parse(message)
            if data['ID']
              puts "#{Time.now} ---- Received from  #{data['ID']}"
              @connected_clients[data['ID']] = client
              case data['Action']
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

  def db_init
    @db_conn = PG::Connection.new(@db_conn_string)
  end

  def db_get_list_commands
    db_init if @db_conn.nil?
    @db_conn.exec_params("SELECT * FROM COMMANDS WHERE STATUS = 0 AND CREATED_AT >= $1", [ Time.now.utc - 180 ]).to_a
  end

  def db_update_command(id, result)
    db_init if @db_conn.nil?
    @db_conn.exec_params("UPDATE COMMANDS SET STATUS = $1 WHERE ID = $2", [result, id]).to_a
  end

  def db_insert_message_log message
    db_init if @db_conn.nil?
    current_time = Time.now
    @db_conn.exec("INSERT INTO message_logs(\"content\", \"created_at\") VALUES ('#{message}','#{current_time}')")
  end

  def db_insert_device code
    db_init if @db_conn.nil?
    result = @db_conn.exec("INSERT INTO devices(\"code\", \"unit_id\", \"is_active\", \"created_at\", \"updated_at\") VALUES ('#{code}', 1, '1','#{Time.now}','#{Time.now}') RETURNING * ")
    device_id = result[0]['id']
    @db_conn.exec("INSERT INTO statuses(\"device_id\", \"updated_at\") VALUES (#{device_id},'#{Time.now}')")
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
      @db_conn.exec_params("INSERT INTO status_histories(\"device_id\", \"relay1_mode\", \"relay1_status\", \"relay2_mode\", \"relay2_status\", \"relay3_mode\", \"relay3_status\",\"relay4_mode\", \"relay4_status\", \"created_at\")
                                   VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", params)
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
