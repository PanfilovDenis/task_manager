class SessionsController < ApplicationController

  def new
  end

 def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:email], params[:session][:password])
      sign_in user
      redirect_to stories_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
  	log_out
    redirect_to root_url, :notice => "Logged out!"
  end

end
