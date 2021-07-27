class ChatsController < ApplicationController
 before_action :authenticate_user!

 def create
  chat = Chat.new(chat_params)
  unless chat.save
   flash[:danger] = "メッセージを入力してください。"
   render template: "rooms/show"
  end
  @chats = chat.room.chats
 end

 private

 def chat_params
  params.require(:chat).permit(:message, :user_id, :room_id)
 end
end
