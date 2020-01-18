require 'rails_helper'

RSpec.describe Tinkoff::CurrencyRates do
  subject(:context) { described_class.new.call }

  let(:currency_rate_usd) { CurrencyRate.usd.first }
  let(:currency_rate_eur) { CurrencyRate.eur.first }

  describe '.call' do
    context 'with correct data' do
      it 'creates new currency rate' do
        VCR.use_cassette('correct_data') do
          expect { context }.to change(CurrencyRate, :count).by(2)
        end
      end

      it 'assign usd buy' do
        VCR.use_cassette('correct_data') do
          context
          expect(currency_rate_usd.buy).to eq(59.95)
        end
      end

      it 'assign usd sell' do
        VCR.use_cassette('correct_data') do
          context
          expect(currency_rate_usd.sell).to eq(63.05)
        end
      end

      it 'assign eur buy' do
        VCR.use_cassette('correct_data') do
          context
          expect(currency_rate_eur.buy).to eq(66.5)
        end
      end

      it 'assign eur sell' do
        VCR.use_cassette('correct_data') do
          context
          expect(currency_rate_eur.sell).to eq(69.9)
        end
      end
    end

    context 'with incorrect data' do
      it 'when not DepositPayments' do
        VCR.use_cassette('incorrect_data') do
          expect { context }.to change(CurrencyRate, :count).by(0)
        end
      end

      it 'when not valid Currency' do
        VCR.use_cassette('incorrect_data_currency') do
          expect { context }.to change(CurrencyRate, :count).by(0)
        end
      end
    end
  end
end
