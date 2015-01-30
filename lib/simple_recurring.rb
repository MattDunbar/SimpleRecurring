require "simple_recurring/engine"

module SimpleRecurring
  mattr_accessor :payment_processor # Currently only supports SimpleRecurring::ProcessorAdapters::Stripe
end