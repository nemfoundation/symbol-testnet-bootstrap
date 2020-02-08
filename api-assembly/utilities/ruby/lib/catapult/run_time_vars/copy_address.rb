module Catapult
  class RunTimeVars
    class CopyAddress < self
      GENERATED_ADDRESSES_PATH = '/addresses/addresses.yaml'

      def run
        # dont replace existing values
        unless self.component_config.value?
          case self.component_config.type
          when :copy_address
            copy_address
          when :friendly_name
            set_friendly_name
          else
            fail "Illegal type '#{self.type}'"
          end  
        end
      end

      protected

      def address_hash?
        @address_hash ||= self.address_position? && self.generated_addresses[self.address_position?]
      end

      def generated_addresses
        # TODO: fix up so use all generated addresses not jsut peer ones
        @generated_addresses ||= self.class.yaml_file_to_hash(GENERATED_ADDRESSES_PATH)['peer_nodes']
      end

      def address_position?
        self.component_config.address_position?
      end

      def key_type
        @key_type ||= self.component_config.key_type
      end

      def attribute_name
        @attribute_name ||= self.component_config.attribute_name
      end

      private

      def copy_address
        # no op if this element does not have address hash
        if address_hash = self.address_hash?
          address = address_hash[self.key_type.to_s] || fail("Could not find key of type '#{self.key_type}'")
          update_attribute!(self.attribute_name, address)
          write_component_config
        end
      end

      FRIENDLY_NAME_ID_LEN = 7
      def set_friendly_name
        # no op if this alement does not have address hash
        if address_hash = self.address_hash?
          friendly_name = "#{address_hash['public'][0..FRIENDLY_NAME_ID_LEN]}"
          update_attribute!(self.attribute_name, friendly_name)
          write_component_config
        end
      end

      def write_component_config
        ::File.open(self.component_config.path, 'w') { |f| f << ::YAML.dump(self.component_config.hash) }
      end

    end
  end
end
