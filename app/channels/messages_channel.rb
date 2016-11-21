class MessagesChannel < ApplicationCable::MessagesChannel
  def subscribed
    # this method is:
    # => responsible for subscribing to and streaming messages
    #    that are broadcast to this channel
    # => streaming messages sent over the messages channel,
    #    which is maintained by Redis

    stream_from 'messages'
  end
end
