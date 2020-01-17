# frozen_string_literal: true

class CurrencyRate < ApplicationRecord
  enum name: {
    usd: 0,
    eur: 1
  }
end
