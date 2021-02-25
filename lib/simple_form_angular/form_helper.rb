module SimpleFormAngular
  module FormHelper
    extend ActiveSupport::Concern

    def simple_form_for(record, options={}, &block)
      if ng_options = options.delete(:ng)
        options[:html] ||= {}
        options[:html].merge! SimpleFormAngular.build_angular_options(ng_options)
      end

      super(record, options, &block)
    end
  end
end

SimpleForm::ActionViewExtensions::FormHelper.send :prepend, SimpleFormAngular::FormHelper
