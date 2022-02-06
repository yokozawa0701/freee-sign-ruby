# frozen_string_literal: true

require "faraday"

module NinjaSign
  module Request

    private

    def request(method, path:, params: nil, payload: nil)
      response = row_request(method, path: path, connection: connection, params: params, payload: payload)
      JSON.parse(response.body)
    end

    def row_request(method, path:, connection:, params: nil, payload: nil)
      connection.public_send(method) do |req|
        case method
        when :post
          req.url path
          req.body = payload.to_json
        else raise ArgumentError, "Unhandled request method '#{method.inspect}'"
        end
      end
    end

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
