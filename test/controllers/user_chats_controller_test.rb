require "test_helper"

class UserChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_chat = user_chats(:one)
  end

  test "should get index" do
    get user_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_user_chat_url
    assert_response :success
  end

  test "should create user_chat" do
    assert_difference('UserChat.count') do
      post user_chats_url, params: { user_chat: { chat_id: @user_chat.chat_id, user_id: @user_chat.user_id } }
    end

    assert_redirected_to user_chat_url(UserChat.last)
  end

  test "should show user_chat" do
    get user_chat_url(@user_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_chat_url(@user_chat)
    assert_response :success
  end

  test "should update user_chat" do
    patch user_chat_url(@user_chat), params: { user_chat: { chat_id: @user_chat.chat_id, user_id: @user_chat.user_id } }
    assert_redirected_to user_chat_url(@user_chat)
  end

  test "should destroy user_chat" do
    assert_difference('UserChat.count', -1) do
      delete user_chat_url(@user_chat)
    end

    assert_redirected_to user_chats_url
  end
end
