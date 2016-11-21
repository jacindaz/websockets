class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user

    if message.save
      # keys:
      # => there is nothing special about the :message or :user keys
      # => we can specify any keys we want and send over the channel
      # => just need to tell our subscriber to expect those keys
      #
      # broadcasting:
      # => we are really sending this message to be saved into Redis
      # => aka "send new messages to the messages channel, which is
      #    is maintained by Redis"
      ActionCable.server.broadcast
        'messages', # name of the channel to which we are broadcasting
        message: message.content,
        user: message.user.username
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
