if defined?(Sequel)
  module Huberry
    module AttrEncrypted
      module Adapters
        module Sequel
          protected
            # Calls attr_encrypted with the options <tt>:encode</tt> and <tt>:marshal</tt> set to true
            # unless they've already been specified
            def attr_encrypted(*attrs)
              options = { :encode => true, :marshal => true }.merge(attrs.last.is_a?(Hash) ? attrs.pop : {})
              super *(attrs << options)
            end
        end
      end
    end
  end
  
  Sequel::Model.extend Huberry::AttrEncrypted::Adapters::Sequel
end