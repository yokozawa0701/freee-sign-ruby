# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client do
  let(:client) { FreeeSign::Client.new }

  describe '.endpoint' do
    it 'should have an endpoint' do
      expect(client.endpoint).to eq(FreeeSign::ENDPOINT)
    end
  end

  describe '.client_id' do
    it 'should have a client_id' do
      expect(client.client_id).to eq(ENV['CLIENT_ID'])
    end
  end

  describe '.client_secret' do
    it 'should have a client_secret' do
      expect(client.client_secret).to eq(ENV['CLIENT_SECRET'])
    end
  end

  describe '.connection' do
    it 'should have a connection' do
      expect(client.connection).not_to eq(nil)
      expect(client.connection.class).to eq(Faraday::Connection)
    end
  end

  describe '.access_token' do
    before do
      stub_request(:post, URI.join(FreeeSign::ENDPOINT, 'v1/token').to_s)
        .with(
          body: { client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'] },
          headers: {
            'Accept' => 'application/json',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type' => 'application/json',
            'User-Agent' => 'Faraday v2.2.0'
          }
        )
        .to_return(status: 201, body: '{"access_token":"fake_token","expires_in":86400,"token_type":"Bearer"}', headers: {})
    end

    it 'NINJA SIGNのaccess_tokenを取得' do
      expect(client.access_token).to eq 'fake_token'
    end
  end
end
