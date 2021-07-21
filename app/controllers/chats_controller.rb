class ChatsController < ApplicationController
 def create
  chat = Chat.new(chat_params)
  if chat.save
   redirect_to room_path(chat.room_id)
  else
   unless chat.valid?
    flash[:danger] = "メッセージを入力してください。"
    redirect_to request.referer
   end
  end
 end

 private

 def chat_params
  params.require(:chat).permit(:message, :user_id, :room_id)
 end
end
