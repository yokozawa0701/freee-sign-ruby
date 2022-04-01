# frozen_string_literal: true

module FreeeSign
  class Client
    module Templates
      def templates(params = {})
        get('/v1/templates', params)
      end

      def template(template_id)
        get("/v1/templates/#{template_id}")
      end
    end
  end
end
