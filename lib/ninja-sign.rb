# frozen_string_literal: true

require_relative 'ninja-sign/version'

module NinjaSign
  class Error < StandardError; end

  def self.greet
    'Hello'
  end
end
