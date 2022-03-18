# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FreeeSign do
  it 'has a version number' do
    expect(FreeeSign::VERSION).not_to be nil
  end

  describe '.client' do
    it 'should be a FreeeSign::Client' do
      expect(FreeeSign.client).to be_a FreeeSign::Client
    end
  end

  describe '.client_id=' do
    it 'should set client_id' do
      FreeeSign.client_id = 'ninja-sign-api+xxx@sight-visit.com'
      expect(FreeeSign.client_id).to eq('ninja-sign-api+xxx@sight-visit.com')
    end
  end

  describe '.client_secret=' do
    it 'should set client_secret' do
      FreeeSign.client_secret = '_xxx'
      expect(FreeeSign.client_secret).to eq('_xxx')
    end
  end

  describe '.configure' do
    FreeeSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set #{key}" do
        FreeeSign.configure do |config|
          config.send("#{key}=", key)
          expect(FreeeSign.send(key)).to eq(key)
        end
      end
    end
  end

  describe '.options' do
    FreeeSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "shourd include #{key}" do
        expect(FreeeSign.options[key]).to eq FreeeSign.send(key)
      end
    end
  end
end
