# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Documents do
  let(:client) { FreeeSign::Client.new }

  before do
    allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
  end

  describe '#documents' do
    subject { client.documents(params) }

    context 'with no params' do
      let(:params) { {} }

      before { stub_get('/v1/documents', 'documents') }

      it do
        expect(subject.size).to eq 2
        expect(a_get('/v1/documents')).to have_been_made.once
      end
    end

    context 'with :per_page' do
      let(:params) { { per_page: 1 } }

      before { stub_get('/v1/documents', 'documents').with(query: params) }

      it do
        subject
        expect(a_get('/v1/documents').with(query: params)).to have_been_made.once
      end
    end
  end

  describe '#create_document' do
    subject { client.create_document }

    before do
      allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
    end

    before { stub_post('/v1/documents', 'documents') }

    it do
      subject
      expect(a_post('/v1/documents')).to have_been_made.once
    end
  end

  describe '#reject_document' do
    subject { client.reject_document(document_id, payload: payload) }
    let(:document_id) { 1 }
    let(:payload) do
      {
        rejector_id: 1,
        message: 'test message'
      }
    end

    before do
      allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
    end

    before { stub_post("/v1/documents/#{document_id}/rejection", 'documents') }

    it do
      subject
      expect(a_post("/v1/documents/#{document_id}/rejection")).to have_been_made.once
    end
  end

  describe '#contract_certificate' do
    subject { client.contract_certificate(document_id) }

    context 'application/json' do
      let(:document_id) { 2 }

      before { stub_get("/v1/documents/#{document_id}/contract_certificate", 'contract_certificate') }

      it do
        subject
        expect(a_get("/v1/documents/#{document_id}/contract_certificate")).to have_been_made.once
      end
    end
  end

  describe '#meta_items' do
    subject { client.meta_items(document_id, payload: payload) }

    let(:document_id) { 1 }
    let(:payload) do
      {
        item_id: 1,
        type: 'string',
        name: 'item_display_name',
        value: 'item_value'
      }
    end

    before { stub_put("/v1/documents/#{document_id}/meta", 'items') }

    it do
      subject
      expect(a_put("/v1/documents/#{document_id}/meta")).to have_been_made.once
    end

    it 'should return a response of items' do
      meta_items = subject
      expect(meta_items.first['name']).to eq 'item_display_name'
      expect(meta_items.first['value']).to eq 'item_value'
    end
  end
end
