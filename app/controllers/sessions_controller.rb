class SessionsController < ApplicationController
    def create
        user = User.find_by_email(params[:email])
    
        if user && user.valid_password?(params[:password])
          token = JwtService.encode(user_id: user.id)
          render json: { token: token }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
end
