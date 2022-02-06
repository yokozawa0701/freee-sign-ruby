# frozen_string_literal: true

require "ninja-sign/version"
require "ninja-sign/configuration"
require "ninja-sign/request"
require "ninja-sign/client"

module NinjaSign
  extend Configuration

  def self.client(options = {})
    NinjaSign::Client.new(options)
  end
end
