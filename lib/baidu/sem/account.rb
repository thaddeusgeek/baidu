module Baidu
  module SEM
    class AccountService < Base
      def getAccountInfo
        operation = make_operation('getAccountInfo')
        puts operation_header

        operation.header = operation_header
        operation.body = {
          :getAccountInfoRequest=>{
            :requestData=>[]
          }
        }

        response = operation.call
        # p response
        if @debug
          puts operation.build
        end

      end
      def updateAccountInfo
      end
    end
  end
end