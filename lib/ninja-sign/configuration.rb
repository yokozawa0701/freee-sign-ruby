# frozen_string_literal: true

module NinjaSign
  module Configuration
    VALID_OPTIONS_KEYS = %i[endpoint client_id client_secret].freeze

    attr_accessor(*VALID_OPTIONS_KEYS)
  end
end
