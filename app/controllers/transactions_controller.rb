class TransactionsController < ApplicationController
	protect_from_forgery except: :webhook
  def create
   # Amount in cents
   @amount = params[:plan][:amount].to_i
   @sub = params[:plan][:period].to_i

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
   plan_end_date= date + @sub.months
   if charge[:status] == "succeeded"
      sub_status = true
   else
      sub_status = false
   end

  if current_user.subscriptions
    @subscription = current_user.subscriptions.first.update(plan_end_date:plan_end_date, plan_id:params[:plan][:id],status:sub_status)
    @subs_id = current_user.subscriptions.first.id
  else
    @subscription= current_user.subscriptions.new(plan_end_date:plan_end_date, plan_id:params[:plan][:id],status:sub_status)
    @subscription.save
    @subs_id=@subscription.id
  end

  @transaction = Transaction.new(transaction_id: charge[:id],created: date,status: charge[:status],paid: charge[:paid], refunded: charge[:refunded],card_id: charge[:source][:id],last4: charge[:source][:last4],brand: charge[:source][:brand],funding: charge[:source][:funding],expiry_month: charge[:source][:exp_month],expiry_year: charge[:source][:exp_year],customer: charge[:source][:customer],bal_transactions: charge[:balance_transaction], subscription_id:@subs_id)
  if @transaction.save
    redirect_to edit_user_registration_path
  end
  
  rescue Stripe::CardError => e
  	flash[:error] = e.message
  	redirect_to transactions_path
  end
end
