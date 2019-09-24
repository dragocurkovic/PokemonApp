module Api
  module V1
    class RestrictionsController < ApiController
      before_action :authenticate_with_token!

      def authenticate_with_token!
        render json: { error: 'Token not valid' }, status: :unauthorized unless current_user
      end

      def current_user
        @current_user ||= authenticate_user
      end

      def authenticate_user
        token = request.headers['X-Token']
        email = request.headers['X-Email']
        return nil if token.blank? || email.blank?
        user = User.find_by(email: email)
        user if user && user.valid_token?(token)
      end
    end
  end
end
