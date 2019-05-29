require 'twilio-ruby'


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
        account_sid = 'AC8e4e1f0de249a74e41d2356ff45f59ce'
        auth_token = 'f5f936a0998212cfe2a39c7f2211c9a8'
        client = Twilio::REST::Client.new(account_sid, auth_token)
        from = '+14175516881' # Your Twilio number
        to = '+14172945180' # Your mobile phone number
        client.messages.create(
            from: from,
            to: to,
            body: @message.description
        )
        

    end


    private

    def message_params
        params.require(:message).permit(:description)
    end
end
