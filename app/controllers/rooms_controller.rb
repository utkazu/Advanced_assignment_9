class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.create
    @entry1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = UserRoom.create(entry2_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @entries = @room.user_rooms
    else
      redirect_back(fallback_location: user_path(current_user.id))
    end
  end


  private
    def entry2_params
      params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id) #@room.idここで使える？
    end
end
