# frozen_string_literal: true

module FreeeSign
  module Configuration
    VALID_OPTIONS_KEYS = %i[client_id client_secret access_token].freeze

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
      self.client_id = ENV['CLIENT_ID']
      self.client_secret = ENV['CLIENT_SECRET']
    end
  end
end
