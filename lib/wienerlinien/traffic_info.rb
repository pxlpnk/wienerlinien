module Wienerlinien
  # TrafficInfo
  class TrafficInfo
    def initialize(connection)
      @connection = connection
    end

    def get(params)
      response = perform_get(params)
      RecursiveOpenStruct.new(
        response.body['data'],
        recurse_over_arrays: true)
    end

    def perform_get(params = {})
      if params[:name]
        response = @connection.get do |req|
          req.params = params
          req.url '/ogd_realtime/trafficInfo'
          req.headers['Content-Type'] = 'application/json'
        end
      else
        raise ParamNotGivenError.new('Please provide one or multiple name=')
      end

      unless response.success?
        # XXX: proper error handling
        puts JSON.parse(response.body)
      end
      p response.body
      response
    end
  end # TrafficInfo
end # Wienerlinien
