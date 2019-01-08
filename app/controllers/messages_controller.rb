class MessagesController < ApplicationController
  def index
    @q = Message.ransack(params[:q])
    @messages = @q.result
  end
end
