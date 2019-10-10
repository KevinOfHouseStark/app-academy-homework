class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def ensure_sub_ownership
    @sub = Sub.find_by(id: params[:id])
    
    unless current_user.id == @sub.moderator_id
      flash[:errors] = "You can't edit this sub"
      redirect_to sub_url(@sub)
    end
  end

  def ensure_post_ownership
    @post = Post.find_by(id: params[:id])

    unless current_user.id == @post.author_id
      flash[:errors] = "You can't edit this post"
      redirect_to post_url(@post)
    end
  end
end
