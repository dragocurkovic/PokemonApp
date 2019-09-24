module Api
  module V1
    class SessionsController < ApiController
      def create
        user = User.find_by(email: params[:email])
        if user && user.valid_password?(params[:password])
          render json: { token: user.token }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
