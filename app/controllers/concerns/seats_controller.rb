class SeatsController < ApplicationController 

  def list
<<<<<<< HEAD
    @seats = Seat.all
    @amount = 20
=======
    @seats = Seat.all.order(:id)
>>>>>>> ce974886298dcf8ccea7c4c02df68a9aa596ca4b
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

  def tickets
    @paid_seats = Seat.where(pendingpayment: true);

  end
  
end