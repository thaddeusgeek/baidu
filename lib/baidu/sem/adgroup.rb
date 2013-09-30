module Baidu
  module SEM
    class AdgroupService < Base
      def getAllAdgroupId
        operation = make_operation('getAllAdgroupId')
        operation.header = operation_header
        operation.body = {
          :getAllAdgroupIdRequest=>{}
        }
        if @debug
          puts operation.build
        end
      end
      def getAdgroupIdByCampaignId(id)
        operation = make_operation('getAdgroupIdByCampaignId')
        operation.header = operation_header
        operation.body ={
          :getAdgroupIdByCampaignIdRequest=>{
            :campaignIds=>id.to_i
          }
        }
        if @debug
          puts operation.build
        end
      end
      def getAdgroupByCampaignId(id)
        operation = make_operation('getAdgroupByCampaignId')
        operation.header = operation_header
        operation.body ={
          :getAdgroupByCampaignIdRequest=>{
            :campaignIds=>id.to_i
          }
        }
        if @debug
          puts operation.build
        end
      end
      def getAdgroupByAdgroupId
        operation = make_operation('getAdgroupByAdgroupId')
        operation.header = operation_header
        operation.body = {
          :getAdgroupByAdgroupIdRequest=>{
            :adgroupIds=>["long"]
          }
        }
      end
      def addAdgroup
      end
      def updateAdgroup
      end
      def deleteAdgroup
      end
    end
  end
end