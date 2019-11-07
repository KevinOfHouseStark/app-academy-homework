class ApplicationController < ActionController::Base


  
  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def current_user
    if session[:session_token]
      user = User.find_by(session_token: session[:session_token])
      @current_user = user
    else
      return nil
    end
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      render json: {error: "Not logged in!"}
    end
  end
end
