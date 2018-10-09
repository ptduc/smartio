require 'test_helper'

class DotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dotum = dota(:one)
  end

  test "should get index" do
    get dota_url
    assert_response :success
  end

  test "should get new" do
    get new_dotum_url
    assert_response :success
  end

  test "should create dotum" do
    assert_difference('Dotum.count') do
      post dota_url, params: { dotum: { action: @dotum.action, ip_address: @dotum.ip_address, name: @dotum.name, name_version: @dotum.name_version, pass: @dotum.pass, path: @dotum.path, port: @dotum.port, user: @dotum.user } }
    end

    assert_redirected_to dotum_url(Dotum.last)
  end

  test "should show dotum" do
    get dotum_url(@dotum)
    assert_response :success
  end

  test "should get edit" do
    get edit_dotum_url(@dotum)
    assert_response :success
  end

  test "should update dotum" do
    patch dotum_url(@dotum), params: { dotum: { action: @dotum.action, ip_address: @dotum.ip_address, name: @dotum.name, name_version: @dotum.name_version, pass: @dotum.pass, path: @dotum.path, port: @dotum.port, user: @dotum.user } }
    assert_redirected_to dotum_url(@dotum)
  end

  test "should destroy dotum" do
    assert_difference('Dotum.count', -1) do
      delete dotum_url(@dotum)
    end

    assert_redirected_to dota_url
  end
end
