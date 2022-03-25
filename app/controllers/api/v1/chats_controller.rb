class Api::V1::ChatsController < Api::V1::ApplicationController

  def messages
    chat = Chat.find(params[:id])
    render json: { messages: chat.messages }
  end

  def send_message
    chat = Chat.find(params[:id])
    message = chat.messages.create!(user_id: current_user.id, body: params[:body])
    ActionCable.server.broadcast 'chat_channel', message.as_json

    render json: {}
  end

end
