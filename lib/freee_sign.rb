# frozen_string_literal: true

require 'freee_sign/version'
require 'freee_sign/configuration'
require 'freee_sign/request'
require 'freee_sign/client'

module FreeeSign
  extend Configuration

  ENDPOINT = ENV.fetch('ENDPOINT', 'https://ninja-sign.com')

  def self.client(options = {})
    FreeeSign::Client.new(options)
  end
end
