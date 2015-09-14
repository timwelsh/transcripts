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
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      redirect_to contact_path, notice: "Your messages is not valid."
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content, :phnumber)
  end

end
