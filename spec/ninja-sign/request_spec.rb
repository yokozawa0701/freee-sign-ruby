# frozen_string_literal: true

require "spec_helper"

RSpec.describe NinjaSign::Request do
  let(:test_class) { Struct.new(:request) { include NinjaSign::Request } }
  let(:request) { test_class.new }
end
