require 'mqtt'

module ControlHelper
  def mqtt_publish(topic, message)
    @client = MQTT::Client.connect('kynguyenxanh.org')
    @client.publish(topic, message)
  end
end
