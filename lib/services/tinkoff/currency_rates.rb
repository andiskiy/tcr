# frozen_string_literal: true

module Tinkoff
  class CurrencyRates < Base
    attr_reader :rate

    def call
      rates.each do |rate|
        @rate = rate
        next unless valid_currency?

        create_currency_rates
      rescue StandardError => e
        raise e, "Message - #{e}; rate - #{rate}"
      end
    end

    private

    def create_currency_rates
      form = CurrencyRateForm.new(CurrencyRate.new)

      raise InvalidRecordError, "Currency Rate form errors - #{form.errors}" unless form.validate(params)

      form.save do |hash|
        form.model.assign_attributes(hash)
        form.save
      end
    end

    def params
      {
        code: from_currency['code'],
        name: from_currency['name'].downcase,
        buy: rate['buy'],
        sell: rate['sell']
      }
    end

    def valid_currency?
      (from_currency_usd? || from_currency_eur?) && to_currency_rub?
    end

    def from_currency_usd?
      from_currency['name'] == usd
    end

    def from_currency_eur?
      from_currency['name'] == eur
    end

    def to_currency_rub?
      to_currency['name'] == rub
    end

    def from_currency
      rate['fromCurrency']
    end

    def to_currency
      rate['toCurrency']
    end

    def usd
      'USD'
    end

    def eur
      'EUR'
    end

    def rub
      'RUB'
    end

    def category
      'DepositPayments'
    end

    def rates
      @rates ||= data['rates'].select { |rate| rate['category'] == category }
    end
  end
end
