# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Templates do
  let(:client) { FreeeSign::Client.new }

  describe '#templates' do
    subject { client.templates(params) }

    before do
      allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
    end

    context 'with no params' do
      let(:params) { {} }

      before { stub_get('/v1/templates', 'templates') }

      it do
        expect(subject.size).to eq 2
        expect(a_get('/v1/templates')).to have_been_made.once
      end
    end

    context 'with :per_page' do
      let(:params) { { per_page: 1 } }

      before { stub_get('/v1/templates', 'templates').with(query: params) }

      it do
        subject
        expect(a_get('/v1/templates').with(query: params)).to have_been_made.once
      end
    end
  end

  describe '#templates(template_id)' do
    subject { client.template(1) }

    before do
      allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
      stub_get('/v1/templates/1', 'template')
    end

    it do
      subject
      expect(a_get('/v1/templates/1')).to have_been_made.once
    end
  end
end
