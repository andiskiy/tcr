# frozen_string_literal: true

module Tinkoff
  class Base
    BASE_URL = 'https://www.tinkoff.ru'

    class InvalidRecordError < StandardError; end

    def data
      @data ||= get_data
    end

    private

    def get_data
      JSON.parse(response)[payload_key]
    end

    def response
      RestClient::Request.execute(
        method: :get,
        url: url
      )
    end

    def url
      "#{BASE_URL}/api/v1/currency_rates/"
    end

    def payload_key
      'payload'
    end
  end
end
