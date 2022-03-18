# frozen_string_literal: true

module FreeeSign
  class Client
    module Templates
      def templates(params = {})
        get('/v1/templates', params)
      end
    end
  end
end
