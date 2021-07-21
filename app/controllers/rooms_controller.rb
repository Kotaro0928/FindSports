class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new
  end

  def create
    if !Room.where(user1_id: current_user.id, user2_id: params[:room][:user2_id]).exists?
      room = Room.new(room_params)
      if room.save
        redirect_to room_path(room)
      else
        flash[:danger] = "チャットルームの作成に失敗しました。"
        redirect_to request.referer
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:user1_id, :user2_id)
  end
end
