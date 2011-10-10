Admin::BaseController.class_eval do
        before_filter :set_currency_to_pln
      end