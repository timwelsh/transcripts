class TransactionsController < ApplicationController
	#protect_from_forgery except: :webhook
  def create

    # Amount in cents
    @amount =params[:amount].to_i
    @sub = params[:subscription_period].to_i

    customer = Stripe::Customer.create(
     :email => params[:stripeEmail],
     :card  => params[:stripeToken]
     )

    charge = Stripe::Charge.create(
     :customer    => customer.id,
     :amount      => @amount,
     :description => 'Rails Stripe customer',
     :currency    => 'usd'
     )
    
    date=Time.at(charge[:created])
 
   
    if charge[:status] == "succeeded"
      sub_status = true
    else
      sub_status = false
    end

    if !current_user.subscription.blank?
      plan_end_date= current_user.subscription.plan_end_date + @sub.months
      @subscription = current_user.subscription.update(plan_end_date:plan_end_date,plan_id:params[:plan_id],status:sub_status)
      @subs_id = current_user.subscription.id
    else
      plan_end_date= date + @sub.months
      @subscription= Subscription.new(plan_end_date:plan_end_date,user_id:current_user.id, plan_id:params[:plan_id],status:sub_status)
      @subscription.save
      @subs_id=@subscription.id
    end

    @transaction = Transaction.new(transaction_id: charge[:id],created: date,status: charge[:status],paid: charge[:paid], refunded: charge[:refunded],card_id: charge[:source][:id],last4: charge[:source][:last4],brand: charge[:source][:brand],funding: charge[:source][:funding],expiry_month: charge[:source][:exp_month],expiry_year: charge[:source][:exp_year],customer: charge[:source][:customer],bal_transactions: charge[:balance_transaction], subscription_id:@subs_id)
    if @transaction.save
      redirect_to new_school_path, :notice => "Your Payment Has Received"
    end
    
  rescue Stripe::CardError => e
  	flash[:error] = e.message
  	redirect_to transactions_path
  end
end
