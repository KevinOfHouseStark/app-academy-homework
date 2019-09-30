class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        render json: params
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render jason: user.errors.full_messages, status: 422
        end
    end
end