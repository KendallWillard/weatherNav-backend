require 'twilio-ruby'
# require_relative '../../apiKeys.rb'

class MessagesController < ApplicationController

    def index
        @messages = Message.all
        render json: @messages
    end

    def new
        @message = Message.new

    end

    def create 
        @message = Message.create(message_params)
        account_sid = process.ENV['TWILIO_SID']
        auth_token = process.ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new(account_sid, auth_token)
        from = '+14175516881' # Your Twilio number
        client.messages.create(
            from: from,
            to: "+1#{@message.phone}",
            body: @message.description
        )
    end


    private

    def message_params
        params.require(:message).permit(:description, :phone)
    end
end
