module SimpleRecurring
  class Subscription
    # Symbol billing_frequency - Symbol representing billing frequency, :daily, :weekly, :monthly, :annually
    # Integer billing_periods_count - Length in billing periods, 0 for indefinite
    # Integer amount - Price as an integer (e.g. 100 - $1.00)
    attr_accessor :billing_frequency, :billing_periods_count
  end
end