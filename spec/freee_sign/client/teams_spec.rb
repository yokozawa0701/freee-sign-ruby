# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Teams do

  describe '#team' do
    let(:client) { FreeeSign::Client.new }
    subject { client.team }

    before do
      allow(client).to receive(:access_token).and_return('access_token')
    end

    before { stub_get('/v1/team', 'team') }

    it do
      subject
      expect(a_get('/v1/team')).to have_been_made.once
    end
  end

  describe '#teams' do
    let(:client) { FreeeSign::Client.new }
    subject { client.teams(params) }

    before do
      allow(client).to receive(:access_token).and_return('access_token')
    end

    context 'with no params' do
      let(:params) { {} }

      before { stub_get('/v1/teams', 'teams') }

      it do
        expect(subject.size).to eq 2
        expect(a_get('/v1/teams')).to have_been_made.once
      end
    end

    context 'with :per_page' do
      let(:params) { { per_page: 1 } }

      before { stub_get('/v1/teams', 'teams').with(query: params) }

      it do
        subject
        expect(a_get('/v1/teams').with(query: params)).to have_been_made.once
      end
    end
  end
end
