# frozen_string_literal: true

require "spec_helper"

RSpec.describe NinjaSign::Client do
  let(:client) { NinjaSign::Client.new }

  describe ".endpoint" do
    it "should have an endpoint" do
      expect(client.endpoint).to eq("https://ninja-sign.com")
    end
  end

  describe ".client_id" do
    it "should have a client_id" do
      expect(client.client_id).to eq(ENV["CLIENT_ID"])
    end
  end

  describe ".client_secret" do
    it "should have a client_secret" do
      expect(client.client_secret).to eq(ENV["CLIENT_SECRET"])
    end
  end

  describe ".connection" do
    it "should have a connection" do
      expect(client.connection).not_to eq(nil)
      expect(client.connection.class).to eq(Faraday::Connection)
    end
  end

  describe ".access_token" do
    it "NINJA SIGNのaccess_tokenを取得" do
      expect(client.access_token).not_to eq(nil)
    end
  end
end
