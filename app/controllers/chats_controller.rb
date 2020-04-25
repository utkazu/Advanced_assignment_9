class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    if UserBook.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(chat_params)
      redirect_to room_path(@chat.room_id)
    else
      redirect_back(fallback_location: user_path(current_user.id))
    end
  end

  private

    def chat_params
      params.require(:chat).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
    end
end
