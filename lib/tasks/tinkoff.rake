# frozen_string_literal: true

namespace :tinkoff do
  task create_currency_rates: :environment do
    p 'Started'

    Tinkoff::CurrencyRates.new.call

    p 'Finished'
  end
end
