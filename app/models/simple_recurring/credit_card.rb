module SimpleRecurring
  class CreditCard
    attr_accessor :card_number, :card_expiry_month, :card_expiry_year, :card_cvc, :card_token

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

    def is_token?
      !@card_token.nil?
    end
  end
end