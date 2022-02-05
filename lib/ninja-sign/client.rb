# frozen_string_literal: true

module NinjaSign
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = NinjaSign.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key]) if options.key?(key)
      end
    end
  end
end
