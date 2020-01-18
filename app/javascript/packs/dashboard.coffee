class Tcr.Dashboard
  @init: ->
    currencyRateChart()

  @update: (setting) ->
    newConfig = config(setting)
    currencyRateChart().data.datasets = newConfig.data.datasets
    currencyRateChart().data.labels = newConfig.data.labels
    currencyRateChart().update()

  currencyRateChart = ->
    return window.currency_rate_char if window.currency_rate_char

    ctx = document.getElementById('myChart').getContext('2d')
    window.currency_rate_char = new Chart(ctx, config(gon))

  config = (setting) ->
    {
      type: 'line'
      data: {
        labels: setting.hours
        datasets: [
          {
            label: 'USD buy'
            fill: false
            backgroundColor: '#FF6384'
            borderColor: '#FF6384'
            data: setting.usd_buy
          }
          {
            label: 'USD sell'
            fill: false
            backgroundColor: '#36A2EB'
            borderColor: '#36A2EB'
            data: setting.usd_sell
          }
          {
            label: 'EUR buy'
            fill: false
            backgroundColor: '#FFCD56'
            borderColor: '#FFCD56'
            data: setting.eur_buy
          }
          {
            label: 'EUR sell'
            fill: false
            backgroundColor: '#4BC0C0'
            borderColor: '#4BC0C0'
            data: setting.eur_sell
          }
        ]
      }
      options: {
        responsive: false
        title: {
          display: true
          text: 'Currency Rates'
        }
        tooltips: {
          mode: 'index'
          intersect: false
        }
        hover: {
          mode: 'nearest'
          intersect: true
        }
        scales: {
          xAxes: [{
            display: true
            scaleLabel: {
              display: true
              labelString: 'Hours'
            }
          }]
          yAxes: [{
            display: true
            scaleLabel: {
              display: true
              labelString: 'Value'
            }
          }]
        }
      }
    }
