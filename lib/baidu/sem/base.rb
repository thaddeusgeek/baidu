module Baidu
  module SEM
    class Base
      attr_accessor :username,:password,:token
      attr_accessor :debug

      def initialize
        classname = self.class.name.split('::').last
        @service_name = classname
        @port_name = classname
        @client = Savon.new("https://api.baidu.com/sem/sms/v3/#{classname}?wsdl")
        # Savon.new(@base_uri+service_name+'?wsdl')
      end

      def operations
        @client.operations(@service_name,@port_name)
      end

      def make_operation(operation_name)
        @client.operation(@service_name,@port_name,operation_name)
      end

      def operation_header
       {
          :AuthHeader=>
          {
            :username=>@username,
            :password=>@password,
            :token=>@token
          }
        }
      end

      def example(operation,with_header=false)
        operation = make_operation(operation)
        if with_header
        {
          :example_header => operation.example_header,
          :example_body => operation.example_body
        }
        else
          operation.example_body
        end
      end

      def invalid_options?(options,necessary_options)
        return true if necessary_options.any?{|necessary_option|!options.has_key?necessary_option}
      end
    end
  end
end