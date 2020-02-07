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

end
