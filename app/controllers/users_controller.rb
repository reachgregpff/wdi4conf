

class UsersController < ApplicationController
  # def new
  #   if logged_in?
  #     redirect_to '/'
  #   else
  #     redirect_to user_path
  #   end
  # end

  def new
    if logged_in?
     redirect_to '/'
    # else
    #   redirect_to users_path
    end
  end

  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    if user.save
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/"
        # else
        #   render :login
      end
    end
  end
  #
  # def destroy
  #   # user = current_user.id
  #   # # raise 'Got the user id'
  #   # user.destroy
  #   # # session[:user_id] = nil
  #   # redirect_to '/login'
  #   end


end
