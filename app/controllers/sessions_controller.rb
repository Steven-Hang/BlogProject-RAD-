class SessionsController < ApplicationController
  

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
      	flash[:success] = "Login Successful"
    else
      redirect_to login_path 
        flash[:danger] = "Invalid Login Details Provided, Please Check Login Details and try Again"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end