# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Documents do
  let(:client) { FreeeSign::Client.new }

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
end
