# frozen_string_literal: true

require "spec_helper"

RSpec.describe NinjaSign do
  it "has a version number" do
    expect(NinjaSign::VERSION).not_to be nil
  end

  describe ".client" do
    it "should be a NinjaSign::Client" do
      expect(NinjaSign.client).to be_a NinjaSign::Client
    end
  end
end
