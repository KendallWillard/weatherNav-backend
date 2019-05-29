class MessagesController < ApplicationController

    def index
        @messages = Message.all
        render json: @messages
    end

    def new
        @message = Message.new

    end

    def create 
        puts "fired2"
        @message = Message.create(message_params)
        system(`osascript -e 'tell application "Messages" to send "Yo Yo" to buddy "Kendall Willard"'`)

    end


    private

    def message_params
        params.require(:message).permit(:description)
    end
end
