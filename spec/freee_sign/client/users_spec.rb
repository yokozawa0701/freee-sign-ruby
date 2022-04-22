# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign::Client::Users do
  let(:client) { FreeeSign::Client.new }

  describe '#users' do
    subject { client.team }

    before do
      allow_any_instance_of(FreeeSign::Client).to receive(:access_token).and_return('access_token')
    end

    before { stub_get('/v1/users', 'users') }

    it do
      subject
      expect(a_get('/v1/users')).to have_been_made.once
    end
  end
end
