module SimpleRecurring
  module ProcessorAdapters
    class BaseAdapter
      # Create the subscription at the provider.
      #
      # Params:
      # SimpleRecurring::CreditCard credit_card
      # SimpleRecurring::Subscription subscription
      # SimpleRecurring::Promotions promotions (optional)
      #
      # Returns:
      # TRUE or FALSE based on success.
      def create_subscription(credit_card, subscription, promotions = nil)
        raise 'Invalid Provider'
      end
    end
  end
end