require "application_system_test_case"

class DotaTest < ApplicationSystemTestCase
  setup do
    @dotum = dota(:one)
  end

  test "visiting the index" do
    visit dota_url
    assert_selector "h1", text: "Dota"
  end

  test "creating a Dotum" do
    visit dota_url
    click_on "New Dotum"

    fill_in "Action", with: @dotum.action
    fill_in "Ip Address", with: @dotum.ip_address
    fill_in "Name", with: @dotum.name
    fill_in "Name Version", with: @dotum.name_version
    fill_in "Pass", with: @dotum.pass
    fill_in "Path", with: @dotum.path
    fill_in "Port", with: @dotum.port
    fill_in "User", with: @dotum.user
    click_on "Create Dotum"

    assert_text "Dotum was successfully created"
    click_on "Back"
  end

  test "updating a Dotum" do
    visit dota_url
    click_on "Edit", match: :first

    fill_in "Action", with: @dotum.action
    fill_in "Ip Address", with: @dotum.ip_address
    fill_in "Name", with: @dotum.name
    fill_in "Name Version", with: @dotum.name_version
    fill_in "Pass", with: @dotum.pass
    fill_in "Path", with: @dotum.path
    fill_in "Port", with: @dotum.port
    fill_in "User", with: @dotum.user
    click_on "Update Dotum"

    assert_text "Dotum was successfully updated"
    click_on "Back"
  end

  test "destroying a Dotum" do
    visit dota_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dotum was successfully destroyed"
  end
end
