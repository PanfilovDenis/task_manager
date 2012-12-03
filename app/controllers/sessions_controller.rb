class SessionsController < ApplicationController
    
  def new
  end

  def create
    form_session_params = params[:session]
    user = User.find_by_email(form_session_params[:email])
    if user && user.authenticate(form_session_params[:email], form_session_params[:password])
      sign_in user
      redirect_to root_url, :notice => "Logged in!"
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
