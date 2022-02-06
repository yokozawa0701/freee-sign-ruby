# frozen_string_literal: true

module NinjaSign
  class Client
    include Request

    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = NinjaSign.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key]) if options.key?(key)
      end
    end

    def access_token
      @access_token ||= request(:post, path: "/v1/token", payload: payload)["access_token"]
    end

    private

    def connection
      @connection ||= build_connection(endpoint)
    end

    def payload
      { "client_id" => client_id, "client_secret" => client_secret }
    end
  end
end
