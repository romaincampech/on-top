class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    authorize @message
    @message.chat_room = Competition.find(params[:competition_id]).chat_room
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast 'messages',
        body: @message.body,
        time: @message.timestamp,
        full_name: @message.user.full_name,
        image_source: 'http://res.cloudinary.com/dkyjujcrz/image/upload/' + @message.user.photo.path,
        id: @message.user.id
      head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
