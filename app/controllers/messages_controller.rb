class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    authorize @message
    @message.chat_room = Competition.find(params[:competition_id]).chat_room
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast 'messages',
        body: @message.body,
        user: @message.user.first_name + " " + @message.user.last_name,
        time: @message.timestamp
      head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
