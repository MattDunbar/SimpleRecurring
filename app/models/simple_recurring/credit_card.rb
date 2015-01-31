module SimpleRecurring
  class CreditCard
    # String card_number - Credit Card Number
    # Integer card_expiry_month - Credit Card Expiry Month (1 = January, 12 = December)
    # Integer card_expiry_year - Credit Card Expiry Year (Full 4 digits, e.g. 2019)
    # Integer card_cvc - Credit Card Verification Code
    # String card_token - Token from the provider identifying the credit card.
    attr_reader :card_number, :card_expiry_month, :card_expiry_year, :card_cvc, :card_token

    # Create a CreditCard object based on a token or card number.
    #
    # Params:
    # String|Integer card_number_or_token
    # Integer card_expiry_month
    # Integer card_expiry_year
    # Integer card_cvc
    def initialize(card_number_or_token, card_expiry_month = nil, card_expiry_year = nil, card_cvc = nil)
      if card_expiry_month == nil
        @card_token = card_number_or_token
      else
        @card_number = card_number_or_token
        @card_expiry_month = card_expiry_month
        @card_expiry_year = card_expiry_year
        @card_cvc = card_cvc
      end
    end

    # Checks if this CreditCard object uses a token representing the card number on the provider side.
    #
    # Returns:
    # TRUE if a token is used, FALSE if not.
    def is_token?
      !@card_token.nil?
    end
  end
end