# TCR

This is Tinkoff Currency Rates. App builds a chart of changes in rates.
## Used technologies

* Rails 6.0.2.1
* Ruby 2.6.5
* PostgreSQL
* Puma
* [Chart.js](https://github.com/chartjs/Chart.js)

## Getting Started

Install [RVM](https://rvm.io/) with Ruby 2.6.5.

Install gems:
```
gem install bundler
bundle install
```

##### Install DB

```
rake db:create
rake db:migrate
```

Just fill in 5 points:

```
rake db:seed
```