class SeatsController < ApplicationController 

  def list
    @seats = Seat.all
    @free_seats_list = []
    #free_seats = Seat.where("status = 'available'")
    @seats.each { |free_seat|
      if(free_seat.status == 'available')
        #puts free_seat.id
        @free_seats_list.push free_seat.id
      end
    }
    @eggs = Egg.all


    #now sample from the free list
    @free_seats_list.shuffle!
    puts @free_seats_list

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
     redirect_to new_charge_path
  end
  
end