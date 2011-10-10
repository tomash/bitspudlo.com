Spree::BaseController.class_eval do
        def set_currency_to_pln
          logger.info "Spree::BaseController#set_currency_to_pln called"
          @currency = Currency.find_by_char_code("PLN")
          session[:currency_id] = :PLN
          Currency.current!(@currency)
        end
      end