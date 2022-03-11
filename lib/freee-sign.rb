# frozen_string_literal: true

require "freee-sign/version"
require "freee-sign/configuration"
require "freee-sign/request"
require "freee-sign/client"

module NinjaSign
  extend Configuration

  ENDPOINT = "https://ninja-sign.com"

  def self.client(options = {})
    NinjaSign::Client.new(options)
  end
end
