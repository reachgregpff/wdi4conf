class SeatsController < ApplicationController 

  def list
    @seats = Seat.all.order(:id)
  end


  def create
    # Amount in cents
    @amount = 500

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

  def tickets
    @paid_seats = Seat.where(pendingpayment: true);

  end
  
end