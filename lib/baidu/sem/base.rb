module Baidu
  module SEM
    class Base
      attr_accessor :username,:password,:token
      attr_accessor :debug

      def initialize(auth)
        classname = self.class.name.split('::').last
        @service_name = classname
        @port_name = classname
        @username = auth.username
        @password = auth.password
        @token = auth.token
        @client = Savon.new("https://api.baidu.com/sem/sms/v3/#{classname}?wsdl")
        # Savon.new(@base_uri+service_name+'?wsdl')
      end
      def method_missing(name, *args, &block)
        p name if debug
        options,debug = args[0],args[1]
        options = {} if options.nil?
        name = name.to_s
        # p args if name == 'getAllAdgroupId'
        name_snake = name.snake_case
        name_request_sym = (name+'Request').to_sym
        name_response_sym = (name+'Response').snake_case.to_sym
        operation = make_operation(name)
        operation.header = operation_header
        operation.body = {
          name_request_sym => options
        }
        ap operation.body if debug
        puts operation.build if debug
        response = operation.call
        ap response if debug
        # ap response.failures if debug
        if response.failures
          raise response.failures.to_s
        else
          response = response.body[name_response_sym]
          response
        end
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