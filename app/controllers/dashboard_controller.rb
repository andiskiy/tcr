# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    @currency_rates = FindCurrencyRatesByDateQuery.new(date: params[:date]).call

    respond_to do |format|
      format.html { gon.push(@currency_rates) }
      format.js
    end
  end
end
