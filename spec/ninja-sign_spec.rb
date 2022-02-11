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

  describe ".client_id=" do
    it "should set client_id" do
      NinjaSign.client_id = "ninja-sign-api+xxx@sight-visit.com"
      expect(NinjaSign.client_id).to eq("ninja-sign-api+xxx@sight-visit.com")
    end
  end

  describe ".client_secret=" do
    it "should set client_secret" do
      NinjaSign.client_secret = "_xxx"
      expect(NinjaSign.client_secret).to eq("_xxx")
    end
  end

  describe ".configure" do
    NinjaSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set #{key}" do
        NinjaSign.configure do |config|
          config.send("#{key}=", key)
          expect(NinjaSign.send(key)).to eq(key)
        end
      end
    end
  end

  describe ".options" do
    NinjaSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "shourd include #{key}" do
        expect(NinjaSign.options[key]).to eq NinjaSign.send(key)
      end
    end
  end
end
