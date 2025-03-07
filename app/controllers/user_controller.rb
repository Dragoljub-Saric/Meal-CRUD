class UserController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    #GET /users - Fetch all users
    def index
        @users = User.all;
        render json: @users
    end

    #GET /users/:id
    def show
        render json: @user
    end

    #PUT /users/:id
    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    #POST /users/
    def create
        @user = new User(user_params)
        if@user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    #DELETE /users/:id Delete a user data
    def destroy 
        @user.destroy
        head :no_content
    end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :calorie_limit)
    end
end
