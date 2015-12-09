class SeatsController < ApplicationController 

  def list
    @seats = Seat.all
  end



  
  def create
    # Amount in cents
    @amount = 500
    @email = params[:stripeEmail]
    @description = params[:StripeDescription]
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_seats_path
  end
  
end