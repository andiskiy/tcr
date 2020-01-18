# frozen_string_literal: true

every 1.hour do
  rake 'tinkoff:create_currency_rates'
end
