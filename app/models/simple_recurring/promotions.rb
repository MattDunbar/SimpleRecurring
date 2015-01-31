module SimpleRecurring
  class Promotions
    # Integer trial_period - Trial period in days.
    # Integer discount_amount - Discount amount as an integer (e.g. 100 = $1.00)
    # Integer discount_billing_periods - The number of billing periods the discount should apply to, or 0 for indefinite.
    attr_accessor :trial_period, :discount_amount, :discount_billing_periods
  end
end