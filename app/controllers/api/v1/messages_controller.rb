module Api
  module V1
    class MessagesController < ApplicationController
      def index
        @messages = Message.all
        render 'messages/index.json'
      end

      def create
        @message = Message.new(message_params)

        if @message.save
          render 'messages/show.json'
        else
          render json: { errors: @message.errors }, status: :unprocessable_entity
        end
      rescue => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end

      private

      def message_params
        params.require(:message).permit(
          :email,
          :first_name,
          :last_name,
          :amount
        )
      end
    end
  end
end
