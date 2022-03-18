# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Request do
  let(:test_class) { Struct.new(:request) { include FreeeSign::Request } }
  subject(:request) { test_class.new }

  it { is_expected.to respond_to :get }
  it { is_expected.to respond_to :post }
end
