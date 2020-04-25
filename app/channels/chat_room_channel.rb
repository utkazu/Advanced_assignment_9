class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat = Chat.create!(content: data['message'], user_id: data['user'], room_id: data['room'])
    # current_user_template = ApplicationController.render_with_signed_in_user(chat.user, 'chats/current_user_chat_message', locals: {chat: chat})
    # user_template = ApplicationController.render_with_signed_in_user(chat.user, 'chats/user_chat_message', locals: {chat: chat})
    ActionCable.server.broadcast 'chat_room_channel', {message: data['message'], user_id: data['user']}
  end

end
