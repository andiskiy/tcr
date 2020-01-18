# frozen_string_literal: true

class FindCurrencyRatesByDateQuery
  attr_reader :date

  def initialize(scope: CurrencyRate, date: '')
    @scope = scope
    @date = date.blank? ? Time.current : Date.parse(date)
  end

  def call
    @scope = @scope.where(created_at: date.beginning_of_day..date.end_of_day)

    generate_hash
  end

  private

  def generate_hash
    {
      hours: usd.decorate.map(&:display_created_at),
      usd_buy: usd.map(&:buy),
      usd_sell: usd.map(&:sell),
      eur_buy: eur.map(&:buy),
      eur_sell: eur.map(&:sell)
    }
  end

  def usd
    @usd ||= @scope.usd
  end

  def eur
    @eur ||= @scope.eur
  end
end
