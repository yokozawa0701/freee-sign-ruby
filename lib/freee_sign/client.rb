# frozen_string_literal: true

module FreeeSign
  class Client
    class AccessTokenCreationFailed < StandardError; end

    Dir[File.expand_path('client/*.rb', __dir__)].sort.each { |f| require f }

    include Request
    include Documents
    include Templates
    include Teams
    include SealImages

    attr_reader :endpoint
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = FreeeSign.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key]) if options.key?(key)
      end
      @endpoint = FreeeSign::ENDPOINT
    end

    def access_token
      response = post('/v1/token', payload: credentials)

      raise AccessTokenCreationFailed, response.to_json unless response.key?('access_token')

      @access_token ||= response['access_token']
    end

    # Todo RequestModuleがconnectionを知っている必要があるのだがそれは疎結合にしなくて良いのか？
    def connection
      @connection ||= build_connection(endpoint)
    end

    private

    def credentials
      { 'client_id' => client_id, 'client_secret' => client_secret }
    end
  end
end
