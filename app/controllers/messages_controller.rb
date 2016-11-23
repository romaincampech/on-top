class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    @message.chat_room = Competition.find(params[:id]).chat_room
    @message.user = current_user
    @message.save
    authorize @message
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
