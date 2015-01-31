module SimpleRecurring
  module ProcessorAdapters
    class BaseAdapter
      # Create the subscription.
      #
      # Params:
      # SimpleRecurring::CreditCard credit_card
      # SimpleRecurring::Subscription subscription
      # SimpleRecurring::Promotions promotions (optional)
      #
      # Returns:
      # String|Integer Reference id or string for use in cancelling the subscription.
      def create_subscription(credit_card, subscription, promotions = nil)
        raise 'Invalid Provider'
      end

      # Cancel the subscription.
      #
      # Params:
      # String|Integer Reference
      #
      # Returns:
      # TRUE or FALSE determined by success
      def cancel_subscription(reference)
        raise 'Invalid Provider'
      end

      # Display name of the adapter / provider.
      #
      # Returns:
      # String with the display name of the adapter / provider.
      def self.display_name
        raise 'Invalid Provider'
      end

      # Version of the adapter.
      #
      # Returns:
      # String with version of the adapter.
      def self.version
        raise 'Invalid Provider'
      end
    end
  end
end