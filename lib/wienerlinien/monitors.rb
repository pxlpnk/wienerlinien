require 'recursive-open-struct'
module Wienerlinien
  # Monitoris
  class Monitors
    def initialize(connection)
      @connection = connection
    end

    def get(params)
      if params[:rbl]
        response = perform_get(params)
      else
        raise ParamNotGivenError.new('Please provide a RBL number.')
      end

      RecursiveOpenStruct.new(
        response.body['data'],
        recurse_over_arrays: true)
    end

    def perform_get(params = {})
      response = @connection.get do |req|
        req.params = params
        req.url '/ogd_realtime/monitor'
        req.headers['Content-Type'] = 'application/json'
      end

      unless response.success?
        # XXX: proper error handling
        puts JSON.parse(response.body)
      end

      response
    end
  end # Monitor
end # Wienerlinien
