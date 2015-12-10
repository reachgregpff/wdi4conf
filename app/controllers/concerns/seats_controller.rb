class SeatsController < ApplicationController 

  def list
    @seats = Seat.all.order(:id)

  end


  def tickets
    @paid_seats = Seat.where(pendingpayment: true);

  end
  
end