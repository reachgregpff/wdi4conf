class SeatsController < ApplicationController 

  def list
    @seats = Seat.all
    @amount = 20
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
      :description => 'Wdi Conf Stripe customer',
      :currency    => 'aud'
    )

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_seats_path
  end
  
end