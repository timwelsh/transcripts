class SubscribeUserToMailingListJob < ActiveJob::Base

  def perform(user)
    gb = Gibbon::API.new
    gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => user.email}})
  end
end
