require 'rails_helper'

RSpec.describe FindCurrencyRatesByDateQuery do
  subject(:context) { described_class }

  describe '.call' do
    let!(:usd_1) { create(:currency_rate, :usd) }
    let!(:usd_2) { create(:currency_rate, :usd) }
    let!(:eur_1) { create(:currency_rate, :eur) }
    let!(:eur_2) { create(:currency_rate, :eur) }

    let(:currency_rates) do
      rates_usd = [usd_1, usd_2]
      rates_eur = [eur_1, eur_2]
      {
        hours: rates_usd.map { |rate| rate.decorate.display_created_at },
        usd_buy: rates_usd.map(&:buy),
        usd_sell: rates_usd.map(&:sell),
        eur_buy: rates_eur.map(&:buy),
        eur_sell: rates_eur.map(&:sell)
      }
    end
    let(:empty_data) do
      {
        hours: [],
        usd_buy: [],
        usd_sell: [],
        eur_buy: [],
        eur_sell: []
      }
    end

    it { expect(context.new(date: Date.current.to_s).call).to eq(currency_rates) }
    it { expect(context.new(date: 1.day.from_now.to_s).call).to eq(empty_data) }
    it { expect(context.new(date: 1.day.ago.to_s).call).to eq(empty_data) }
  end
end
