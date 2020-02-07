class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_upload_path
    else
      flash.now[:notice] = "Error"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "Logged Out"
  end

end
