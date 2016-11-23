class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    authorize @message
    @message.chat_room = Competition.find(params[:competition_id]).chat_room
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast 'messages',
        message: @message.body,
        user: @message.user.first_name + " " + @message.user.last_name
      head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
