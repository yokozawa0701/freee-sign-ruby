# frozen_string_literal: true

require "faraday"

module NinjaSign
  module Request

    def post(path, payload: nil)
      response = connection.post do |request|
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
  end
end
