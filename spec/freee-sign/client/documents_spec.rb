# frozen_string_literal: true

require "spec_helper"

RSpec.describe FreeeSign::Client::Documents do
  let(:client) { FreeeSign::Client.new }

  describe "#documents" do
    subject { client.documents(params) }

    before { stub_get("/v1/documents", "documents") }

    context "with no params" do
      let(:params) { {} }

      it { expect(subject.size).to eq 2 }
    end
  end
end
