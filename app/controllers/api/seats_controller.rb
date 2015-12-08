class Api::SeatsController < ApplicationController 

  def index
    #@dishes = Dish.all
    @seats = Seat.all
    render json: @seats
  end

end