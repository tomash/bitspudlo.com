module Spree

  class Environment
    include EnvironmentExtension

    attr_accessor :calculators, :payment_methods

    def initialize
      @calculators = Calculators.new
    end
  end
end
