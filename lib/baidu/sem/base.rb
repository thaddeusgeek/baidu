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
      end
      def method_missing(name, *args, &block)
        options,debug = args[0],args[1]
        options = {} if options.nil?
        name = name.to_s
        name_snake = name.snake_case
        # p name
        name_tmp =
        case name
          when 'getAllCampaign'
            'GetAllCampaign'
          when 'getCampaignByCampaignId'
            'GetCampaignByCampaignId'
          when 'addCampaign'
            'AddCampaign'
          when 'updateCampaign'
            'UpdateCampaign'
          when 'deleteCampaign'
            'DeleteCampaign'
          when 'getCampaignByCampaignId'
            'GetCampaignByCampaignId'
          else
            name
        end

        name_request_sym = (name_tmp+'Request').to_sym #if %w(getCampaignByCampaignId getAllCampaign addCampaign updateCampaign deleteCampaign).include?name
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
        Baidu::Response.new(response,name_response_sym)
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

    end
  end
end