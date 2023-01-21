class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:sucess] = "Welcome #{user.username}"
      redirect_to root_path
    else
      flash.now[:error] = "wrong login details"
      render "new"
    end

    def destroy
      session[:user_id] = nil
      flash[:sucess] = "Logout sucessfuly"
      redirect_to login_path
    end
  end
end
