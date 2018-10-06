require "application_system_test_case"

class MessageLogsTest < ApplicationSystemTestCase
  setup do
    @message_log = message_logs(:one)
  end

  test "visiting the index" do
    visit message_logs_url
    assert_selector "h1", text: "Message Logs"
  end

  test "creating a Message log" do
    visit message_logs_url
    click_on "New Message Log"

    fill_in "Content", with: @message_log.content
    click_on "Create Message log"

    assert_text "Message log was successfully created"
    click_on "Back"
  end

  test "updating a Message log" do
    visit message_logs_url
    click_on "Edit", match: :first

    fill_in "Content", with: @message_log.content
    click_on "Update Message log"

    assert_text "Message log was successfully updated"
    click_on "Back"
  end

  test "destroying a Message log" do
    visit message_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message log was successfully destroyed"
  end
end
