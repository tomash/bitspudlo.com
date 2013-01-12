module EnvironmentExtension
  extend ActiveSupport::Concern

  module InstanceMethods

    def add_class(name)
      self.instance_variable_set "@#{name}", Set.new
      create_method( "#{name}=".to_sym ) { |val| 
        instance_variable_set( "@" + name, val)
      }

      create_method( name.to_sym ) { 
        instance_variable_get( "@" + name ) 
      }
    end

    private

      def create_method( name, &block )
        self.class.send( :define_method, name, &block )
      end

  end

end

