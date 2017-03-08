class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
  # def create
  #   @message = Message.create(message_params)
  #   @message.chat_room = Competition.find(params[:competition_id]).chat_room
  #   @message.user = current_user
  #   if @message.save
  #     ActionCable.server.broadcast 'messages',
  #       body: @message.body,
  #       time: @message.timestamp,
  #       full_name: @message.user.full_name,
  #       image_source: 'http://res.cloudinary.com/dkyjujcrz/image/upload/' + @message.user.profile_picture.path,
  #       id: @message.user.id,
  #       chat_room_id: @message.chat_room_id
  #     head :ok
  #   end
  # end

  # private
  # def message_params
  #   params.require(:message).permit(:body)
  # end
end
