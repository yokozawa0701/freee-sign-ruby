# frozen_string_literal: true

require "faraday"

module FreeeSign
  module Request
    def get(path, params = {})
      response = connection.get do |request|
        set_authorization_header!(request, path)
        request.params.merge!(params)
        request.url path
      end
      JSON.parse(response.body)
    end

    def post(path, payload: nil)
      # Todo connectionはClientから渡した方が良い？
      response = connection.post do |request|
        set_authorization_header!(request, path)
        request.url path
        request.body = payload.to_json
      end
      JSON.parse(response.body)
    end

    private

    def build_connection(endpoint, headers: {})
      headers["Accept"] ||= "application/json"
      headers["Content-Type"] ||= "application/json"
      Faraday.new(
        url: endpoint,
        headers: headers
      )
    end

    def set_authorization_header!(request, path)
      return if path == "/v1/token"

      request.headers.merge!(authorization_header)
    end

    def authorization_header
      {
        "Authorization" => "Bearer #{access_token}"
      }
    end
  end
end
