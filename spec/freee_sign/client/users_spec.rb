# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Users do
  let(:client) { FreeeSign::Client.new }

  before do
    allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
  end

  describe '#users' do
    subject { client.users(params) }

    context 'with no params' do
      let(:params) { {} }

      before { stub_get('/v1/users', 'users') }

      it do
        expect(subject.size).to eq 2
        expect(a_get('/v1/users')).to have_been_made.once
      end
    end

    context 'with :per_page' do
      let(:params) { { per_page: 1 } }

      before { stub_get('/v1/users', 'users').with(query: params) }

      it do
        subject
        expect(a_get('/v1/users').with(query: params)).to have_been_made.once
      end
    end
  end
end
