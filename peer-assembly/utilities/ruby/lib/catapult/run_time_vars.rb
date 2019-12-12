module Catapult
  class RunTimeVars
    META_FILENAME = 'meta.yaml'
    META_PATH     = ::File.expand_path("config/#{META_FILENAME}", RUBY_BASE_DIR)

    require_relative('run_time_vars/component_config')
    require_relative('run_time_vars/copy_address')
    require_relative('run_time_vars/set_var')

    def initialize(name, source, targets)
      @name             = name
      @component_config = ComponentConfig.new(source)
      @targets          =  targets
    end

    # Could be overwritten
    def self.run
      self.elements.each { |el| el.run }
    end
    
    def self.fqdn(rel_path)
      ::File.expand_path(rel_path, BASE_DIR)
    end

    def self.yaml_file_to_hash(path)
      if ::File.exists?(path)
        yaml_text = ::File.open(path).read
        unless yaml_text.empty?
          ::YAML.load(yaml_text)
        end
      end || {}
    end

    protected

    attr_reader :name, :component_config, :targets

    def self.meta_hash
      @meta_hash ||= yaml_file_to_hash(META_PATH)
    end

    private
    
    def self.elements
      self.meta_hash['run_time_vars'].map do |var_info|
        new(var_info['name'], var_info['source'], var_info['targets'])
      end
    end

    def update_attribute!(attribute_name, value)
      self.component_config.update_attribute!(attribute_name, value)
    end

  end
end


                            
