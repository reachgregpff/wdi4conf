class Api::SeatsController < ApplicationController 

    # skip_before_filter  :verify_authenticity_token

  def index
    #@dishes = Dish.all
    @seats = Seat.all.order(:id)
    render json: @seats
  end

  def update

    seat = Seat.find(params[:id])

    seat.pendingpayment = true

    seat.save
    render json: seat
    #   render json: { errors: 'updatings failed'}
    # end

  end

  def seat_params 
    #allow these params to be updated
    params.require(:seat).permit(:pendingpayment, :price)
  end

end