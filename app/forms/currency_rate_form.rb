# frozen_string_literal: true

class CurrencyRateForm < Reform::Form
  properties :code, :name, :buy, :sell

  validates :code, :name, :buy, :sell, presence: true
  validates :name, inclusion: { in: CurrencyRate.names.keys }
end
