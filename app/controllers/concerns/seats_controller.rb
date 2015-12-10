class SeatsController < ApplicationController 

  def list
    @seats = Seat.all.order(:id)

  end


  def tickets
    @paid_seats = Seat.where('pendingpayment = true')
    mark_sold_seats = @paid_seats
    @amount = 0
    mark_sold_seats.each do | mark_sold_seat |
      mark_sold_seat.status = "sold"
      @amount = @amount + mark_sold_seat.price
      mark_sold_seat.pendingpayment = false
      mark_sold_seat.save
    end 
  end
  
end