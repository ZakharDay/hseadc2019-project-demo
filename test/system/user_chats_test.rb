require "application_system_test_case"

class UserChatsTest < ApplicationSystemTestCase
  setup do
    @user_chat = user_chats(:one)
  end

  test "visiting the index" do
    visit user_chats_url
    assert_selector "h1", text: "User Chats"
  end

  test "creating a User chat" do
    visit user_chats_url
    click_on "New User Chat"

    fill_in "Chat", with: @user_chat.chat_id
    fill_in "User", with: @user_chat.user_id
    click_on "Create User chat"

    assert_text "User chat was successfully created"
    click_on "Back"
  end

  test "updating a User chat" do
    visit user_chats_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @user_chat.chat_id
    fill_in "User", with: @user_chat.user_id
    click_on "Update User chat"

    assert_text "User chat was successfully updated"
    click_on "Back"
  end

  test "destroying a User chat" do
    visit user_chats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User chat was successfully destroyed"
  end
end
