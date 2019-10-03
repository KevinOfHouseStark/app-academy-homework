class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user #login
            session[:session_token] = user.session_token
            redirect_to cats_url
        else
            flash.now[:errors] = ["Invalid credentials"]
            render :new, status: 422
        end
    end

    def destroy
        @current_user.reset_session_token! if @current_user
        session[:session_token] = ""
        redirect_to new_session_url
    end
end