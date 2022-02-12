# frozen_string_literal: true

module NinjaSign
  class Client
    Dir[File.expand_path("client/*.rb", __dir__)].sort.each { |f| require f }

    include Request
    include Documents

    attr_reader :endpoint
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = NinjaSign.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key]) if options.key?(key)
      end
      @endpoint = NinjaSign::ENDPOINT
    end

    def access_token
      @access_token ||= post("/v1/token", payload: credentials).fetch("access_token")
    end

    private

    # Todo RequestModuleがconnectionを知っている必要があるのだがそれは疎結合にしなくて良いのか？
    def connection
      @connection ||= build_connection(endpoint)
    end

    def credentials
      { "client_id" => client_id, "client_secret" => client_secret }
    end
  end
end
