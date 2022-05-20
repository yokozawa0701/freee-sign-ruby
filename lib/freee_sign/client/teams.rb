# frozen_string_literal: true

module FreeeSign
  class Client
    module Teams
      def team
        get('/v1/team')
      end

      def teams(params = {})
        get('/v1/teams', params)
      end
    end
  end
end
