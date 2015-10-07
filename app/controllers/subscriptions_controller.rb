class SubscriptionsController < ApplicationController
  def new
    @plan = Plan.find(params[:plan_id])
  end
  protect_from_forgery except: :webhook
  def webhook
    event = Stripe::Event.retrieve(params["id"])
    case event.type
      when "invoice.payment_succeeded" #renew subscription
        plan_end_date= Date.today + 1.year
        current_user.subscription.update(plan_end_date:plan_end_date)
    end
    redirect_to dashboard_homes_path, :notice => 'Plan has been purchased successfully'
  end
end
