module SymbolUtilities
  class RunTimeVars
    class ComponentConfig
      DEFAULT_OPERATION_TYPE = :copy_key
      DEFAULT_KEY_TYPE       = :private
      def initialize(source)
        @address_position = source['address_position']
        @path             = RunTimeVars.fqdn(source['path']) || fail("Missing source['path']")
        @attribute_name   = source['key'] ||  fail("Missing source['key']")
        @type             = (source['type'] || DEFAULT_OPERATION_TYPE).to_sym
        @key_type         = (source['key_type'] || DEFAULT_KEY_TYPE).to_sym
      end
 
      attr_reader :path, :attribute_name, :type, :key_type

      def address_position?
        @address_position
      end
      
      def hash
        @hash ||= RunTimeVars.yaml_file_to_hash(self.path)
      end

      def attributes
        @attributes ||= self.hash['attributes'] ||= {}
      end
      
      def value?
        @value ||= self.attributes[self.attribute_name]
      end

      def update_attribute!(attribute_name, value)
        self.attributes.merge!(attribute_name => value)
      end

    end
  end
end


                            
