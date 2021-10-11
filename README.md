# Ohmysupport

Missing helpdesk engine for Rails apps

## Usage
TBD

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ohmysupport'
```

And then execute:
```bash
$ bundle install
```

```bash
rails ohmysupport:install:migrations
```

Seed some categories for support tickets and articles in knowledge base
```ruby
Ohmysupport::Category.create!(name: 'Platform', description: 'Everything related to the functionality of application')
Ohmysupport::Category.create!(name: 'Billing', description: 'Payments and refunds')
Ohmysupport::Category.create!(name: 'VPN connection', description: 'Connectivity related issues')
```

## TODO:

* Create ticket on incoming mail
* Decouple engine from devise dependencies
* Cover with specs
* Fully use I18n
* I18n rake specs
* Make a demo app

## Contributing
TBD

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
