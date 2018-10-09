require 'test_helper'

class CommandControllerTest < ActionDispatch::IntegrationTest
  test "should get code" do
    get command_code_url
    assert_response :success
  end

  test "should get action:integer" do
    get command_action:integer_url
    assert_response :success
  end

  test "should get command:text" do
    get command_command:text_url
    assert_response :success
  end

  test "should get status:tinyint" do
    get command_status:tinyint_url
    assert_response :success
  end

end
