#    Copyright 2018 Tech Bureau, Corp
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
module SymbolUtilities
  class GenerateCertsAndKeys
    def initialize(node_type, target_config_dir, num_nodes: 1)
      @node_type         = node_type.to_sym
      @target_config_dir = target_config_dir
      @num_nodes         = num_nodes
    end

    def write_crypto_info_to_files
      self.cert_generate.write_to_files
    end

    def component_keys
      @component_keys ||= Keys::Component.new(self.keys_handle)
    end

    def component_indexes
      (0..self.num_nodes-1).to_a
    end

    attr_reader :node_type

    def config_dir_full_path(component_index)
      fail "Currently not implemented: multiple peers of same type" unless component_index == 0
      self.target_config_dir
    end

    protected

    attr_reader :target_config_dir, :num_nodes

    def keys_handle
      @keys_handle ||= Keys::Handle.new(self.node_type => self.cert_generate.indexed_keys)
    end

    def cert_generate
      @cert_generate ||= CertGenerate.new(self)
    end
    
    private
    
    
  end
end

