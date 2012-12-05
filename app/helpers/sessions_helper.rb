module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
  	if (session[:user_id])
    	@current_user = User.find(session[:user_id])
    	return @current_user
    else
    	return nil
    end
  end

  def signed_in?
  	if (session[:user_id] && User.find(session[:user_id]))
  	  return true
  	else 
  	  return false
  	end
  end 

  def get_user_login(user_id)
  	@user = User.find(user_id)
  	return @user.login
  end

  def author?(story_user_id)
    if (signed_in? && current_user.id == story_user_id)
      return true
    else 
      return false
    end
  end

end
