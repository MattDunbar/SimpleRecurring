# SimpleRecurring

## Overview
A uniform and simple way to create recurring payments with supported providers.

## Installation
Add the gem to your Gemfile.
```ruby
gem 'SimpleRecurring'
```

Install any payment gateway adapter gems by following instructions in their README.

## Usage
Get a list of available adapters (including display name and version, for use in an admin panel or similar):
```ruby
SimpleRecurring.adapters
```

Get the adapter class:
```ruby
SimpleRecurring.adapter('adaptername')
```

Get an instance of the adapter:
```ruby
SimpleRecurring.adapter('adaptername').new
```

Create a subscription:
```ruby
# Create a credit card with a test number that expires Jan 2020 and has 123 as it's CVC.
# CVC is optional when using a card number (although, certain providers may require it).
credit_card = SimpleRecurring::CreditCard.new('4111111111111111', 1, 2020, 123)
# For providers that support tokens you can also pass in the token as the first parameter.
# Only the first parameter should be set when using a token.
# e.g.
# credit_card = SimpleRecurring::CreditCard.new('123abc_token_string123')

# Create a representation of the subscription.
subscription = SimpleRecurring::Subscription.new
# Set the billing frequency.
subscription.billing_frequency = :monthly # :daily, :weekly, :monthly or :annually
# Set the number of billing periods.
subscription.billing_periods_count = 6 # Length in billing periods, nil or 0 for indefinite

# Get an instance of the adapter.
adapter = SimpleRecurring.adapter('adaptername').new

# Create the subscription and get a string or integer back to reference it by in the future.
subscription_reference = adapter.create_subscription(credit_card, subscription)
```

Canceling a subscription:
```ruby
# Subscription reference was returned from create_subscription and should have been stored.
subscription_reference = '123abc'

# Get an instance of the adapter.
adapter = SimpleRecurring.adapter('adaptername').new

# Cancel the subscription. Returns true or false for success / failure.
adapter.create_subscription(subscription_reference)
```

## Creating An Adapter
Adapters should be a class with their adapter name (single word, with only the first character capitalized) within the `SimpleRecurring::ProcessorAdapters` namespace.

All adapters must extend `SimpleRecurring::ProcessorAdapters::BaseAdapter` which includes all necessary methods which have to be implemented in the adapter.

`SimpleRecurring::ProcessorAdapters::BaseAdapter` can be found in this extension at `lib/simple_recurring/processor_adapters/base_adapter.rb`.
