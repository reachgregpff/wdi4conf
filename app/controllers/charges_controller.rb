class ChargesController < ApplicationController
  def new
   pending_seats = Seat.where('pendingpayment = true')
   @amount = 0;
   pending_seats.each do | seat | 
     @amount = @amount + seat.price
     #puts @amount 
     #puts seat.price
     #puts seat.id
     #puts seat.pendingpayment
   end

  end
  
  def create
    # Amount in cents
    @amount = params[:stripeAmount].to_i * 100
    @email = params[:stripeEmail]

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
     redirect_to charges_path
     flash[:notice] = "please try again"       
  end
end
