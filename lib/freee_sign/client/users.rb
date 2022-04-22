# frozen_string_literal: true

module FreeeSign
  class Client
    module Users
      def users(params = {})
        get('/v1/users', params)
      end
    end
  end
end
