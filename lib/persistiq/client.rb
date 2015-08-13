require 'faraday'
require 'faraday_middleware'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}

module Persistiq
  class Client
    include Persistiq::Client::User
    include Persistiq::Client::Lead
    include Persistiq::Client::Campaign

    attr_reader :api_key, :logger

    def initialize(api_key, logger = true)
      @api_key = api_key
      @logger  = logger
    end

    def get(path, options={})
      connection.get(path, options).body
    end

    def post(path, req_body)
      connection.post do |req|
        req.url(path)
        req.body = req_body
      end.body
    end

    def put(path, options={})
      connection.put(path, options).body
    end

    def delete(path, options = {})
      connection.delete(path, options).body
    end

    def paginate(path)
      results = []

      begin
        res = get(path)
        unless res.data.empty?
          results.push res.data
          page = res.next_page
          page.slice!('https://api.persistiq.com/v1/')
          path = page
        end
      end while res.has_more
      json = {has_more: false, data: results.flatten}
      Hashie::Mash.new json
    end

    private

    def connection
      Faraday.new(url: "https://api.persistiq.com/v1", headers: { accept: 'application/json', 'x-api-key': api_key }) do |conn|
        conn.request    :json
        conn.response   :logger if logger
        conn.use        FaradayMiddleware::Mashify
        conn.response   :json
        conn.adapter    Faraday.default_adapter
      end
    end
  end
end
