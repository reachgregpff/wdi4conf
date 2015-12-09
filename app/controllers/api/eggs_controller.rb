class Api::EggsController < ApplicationController 

  def index
    @eggs = Egg.all
    render json: @eggs
  end

end