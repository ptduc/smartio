require 'test_helper'

class MessageLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_log = message_logs(:one)
  end

  test "should get index" do
    get message_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_message_log_url
    assert_response :success
  end

  test "should create message_log" do
    assert_difference('MessageLog.count') do
      post message_logs_url, params: { message_log: { content: @message_log.content } }
    end

    assert_redirected_to message_log_url(MessageLog.last)
  end

  test "should show message_log" do
    get message_log_url(@message_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_log_url(@message_log)
    assert_response :success
  end

  test "should update message_log" do
    patch message_log_url(@message_log), params: { message_log: { content: @message_log.content } }
    assert_redirected_to message_log_url(@message_log)
  end

  test "should destroy message_log" do
    assert_difference('MessageLog.count', -1) do
      delete message_log_url(@message_log)
    end

    assert_redirected_to message_logs_url
  end
end
