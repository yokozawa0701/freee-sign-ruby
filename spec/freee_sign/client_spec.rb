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
        .to_return(response)
    end

    context 'success' do
      let(:response) do
        {
          status: 201, body: '{"access_token":"access_token","expires_in":86400,"token_type":"Bearer"}', headers: {}
        }
      end

      it 'returns access_token' do
        expect(client.access_token).to eq 'access_token'
      end
    end

    context 'unauthorized' do
      let(:response) do
        {
          status: 401,
          body: '{"error":"unauthorized", "message":"クライアントの認証に失敗しました。client_id・client_secretを確認してください"}',
          headers: {}
        }
      end

      it 'does NOT return access_token' do
        expect { client.access_token }.to raise_error(described_class::AccessTokenCreationFailed)
      end
    end

    context 'disallowed IP address' do
      let(:response) do
        {
          status: 403,
          body: '{"error":"forbidden", "message":"許可されたIPアドレスからのアクセスではありません。IPアドレス制限を確認してください"}',
          headers: {}
        }
      end

      it 'does NOT return access_token' do
        expect { client.access_token }.to raise_error(described_class::AccessTokenCreationFailed)
      end
    end

    context 'Internal Server Error' do
      let(:response) do
        {
          status: 500,
          body: '{"error":"internal_server_error", "message":"大変申し訳ございません。エラーが発生しました。今しばらくお待ちいただき再度お試しください"}',
          headers: {}
        }
      end

      it 'does NOT return access_token' do
        expect { client.access_token }.to raise_error(described_class::AccessTokenCreationFailed)
      end
    end
  end
end
