class SeatsController < ApplicationController 

  def list
    @seats = Seat.all
    
  end

end