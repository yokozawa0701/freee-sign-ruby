# frozen_string_literal: true

module FreeeSign
  class Client
    module Teams
      def team
        get('/v1/team')
      end
    end
  end
end
