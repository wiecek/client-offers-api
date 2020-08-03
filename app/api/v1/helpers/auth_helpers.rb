module V1
  module Helpers
    module AuthHelpers
      def warden
        env['warden']
      end

      def authenticated?
        return true if warden.authenticated?

        token = headers['X-Access-Token']

        return false if token.nil?

        @user = User.find_by(authentication_token: token)
      end

      def current_user
        warden.user || @user
      end
    end
  end
end
