# frozen_string_literal: true

require "ninja-sign/version"
require "ninja-sign/client"

module NinjaSign
  def self.client(options = {})
    NinjaSign::Client.new(options)
  end
end
