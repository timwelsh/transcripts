class PagesController < ApplicationController
	def about
	end

	def contact
		@message = Message.new
	end


	def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      UserMailer.new_message(@message).deliver
      redirect_to root_path, notice: "Your messages has been sent successfully."
    else
      redirect_to root_path, alert: "Your messages is not valid."
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content, :phnumber)
  end

end
