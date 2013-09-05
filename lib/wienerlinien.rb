require 'faraday'
require 'faraday_middleware'
require 'wienerlinien/version'
require_relative 'wienerlinien/errors'
require_relative 'wienerlinien/monitors'
require_relative 'wienerlinien/news_list'
require_relative 'wienerlinien/traffic_info'
require_relative 'wienerlinien/traffic_info_list'


module Wienerlinien
  class Client
    def initialize(sender, params = {})
      @params = params.merge( {sender: sender})
      @connection = Faraday.new(:url => 'http://www.wienerlinien.at') do |faraday|
        faraday.response :json, :content_type => /\bjson$/
        faraday.request :json
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def monitors(params={})
      monitors = Monitors.new(@connection)
      monitors.get(@params.merge(params))
    end

    def traffic_info_list(params={})
      traffic_info_list = TrafficInfoList.new(@connection)
      traffic_info_list.get(@params.merge(params))
    end

    def traffic_info(params={})
      traffic_info = TrafficInfo.new(@connection)
      traffic_info.get(@params.merge(params))
    end

    def news_list(params= {})
      news_list = NewsList.new(@connection)
      news_list.get(@params.merge(params))
    end

  end # Client
end # Winerlinien
