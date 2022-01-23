# frozen_string_literal: true

module NinjaSign
  module Configuration
    VALID_OPTIONS_KEYS = %i[endpoint client_id client_secret].freeze

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge(key => send(key))
      end
    end

    def reset
      self.endpoint = ENV["ENDPOINT"]
      self.client_id = ENV["CLIENT_ID"]
      self.client_secret = ENV["CLIENT_SECRET"]
    end
  end
end
