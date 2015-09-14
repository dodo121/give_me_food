class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def create
    ActionCable.server.broadcast 'messages',
        message: params[:message][:body],
        username: current_user.email
    head :ok
  end
end