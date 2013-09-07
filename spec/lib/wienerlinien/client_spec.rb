require 'spec_helper'

describe Client do
  describe 'methods' do
    before(:all) do
      @client = Client.new('sender_id')
    end

    it { @client.should respond_to(:monitors).with(2).arguments }

    it { @client.should respond_to(:traffic_info_list).with(0).arguments }
    it { @client.should respond_to(:traffic_info_list).with(1).arguments }

    it { @client.should respond_to(:traffic_info).with(0).arguments }
    it { @client.should respond_to(:traffic_info).with(1).arguments }

    it { @client.should respond_to(:news_list).with(0).arguments }
    it { @client.should respond_to(:news_list).with(1).arguments }
  end

  describe '#monitors' do
    before(:all) do
      @client = Client.new('sender_id')
      @params = { rbl: 123 }
    end

    it 'creates a new Monitor object', :vrc do
      # monitor = double(Monitors)
      # monitor.should_receive(:new).with(@params)
      VCR.use_cassette('monitors') do
        @client.monitors(@params)
      end
    end
  end
end
