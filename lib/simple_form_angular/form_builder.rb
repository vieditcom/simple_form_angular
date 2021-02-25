module SimpleFormAngular
  module FormBuilder
    extend ActiveSupport::Concern

    def input(attribute_name, options = {}, &block)
      if ng_options = options.delete(:ng)
        options[:input_html] ||= {}
        options[:input_html].merge! SimpleFormAngular.build_angular_options(ng_options)
      end

      super(attribute_name, options, &block)
    end
  end
end

SimpleForm::FormBuilder.send :prepend, SimpleFormAngular::FormBuilder
