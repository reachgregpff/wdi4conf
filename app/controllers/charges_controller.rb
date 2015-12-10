class ChargesController < ApplicationController
  def new
   @amount = Seat.find(201).price;
   #redirect_to '/payment'
   #render js: => "window.location = '/charges/new'"  
  end
  
  def create
    # Amount in cents

    @amount = params[:stripeAmount].to_i * 100
    # @email = params[:stripeEmail]

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

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to charges_path
     flash[:notice] = "please try again"       
  end
end
