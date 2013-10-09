module Baidu
  module SEM
    class BulkJobService < Base
      # class getChangedCampaignIdResponse
      #   attr_accessor :endTime, :changedCampaignIds
      # end
      # class getChangedIdResponse
      #   attr_accessor :endTime, :changedCampaignIds,:changedAdgroupIds,:changedKeywordIds,:changedCreativeIds,:changedNewCreativeIds
      # end
      # def method_missing(name, *args, &block)
      #   name = name.to_s
      #   name_snake = name.snake_case
      #   name_request_sym = (name+'Request').to_sym
      #   name_response_sym = (name+'Response').snake_case.to_sym
      #   operation = make_operation(name)
      #   operation.header = operation_header
      #   operation.body = {
      #     name_request_sym => args[0]
      #   }
      #   puts operation.build if @debug
      #   response = operation.call
      #   response = response.body[name_response_sym]
      #   response
      # end
      # def getChangedCampaignId(options)
      #   operation = make_operation('getChangedCampaignId')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getChangedCampaignIdRequest=>options
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      #   response = operation.call
      #   response = response.body[:get_changed_campaign_id_response]
      #   r = getChangedCampaignIdResponse.new
      #   r.endTime = response[:endTime]
      #   r.changedCampaignIds = response[:changedCampaignIds]
      #   r
      # end
      # def getChangedId(startTime)
      #   operation = make_operation('getChangedId')
      #   operation.header = operation_header
      #   operation.body = {:getChangedIdRequest=>{:startTime=>startTime}}
      #   response = operation.call
      #   r = getChangedIdResponse.new
      #   r.endTime = response[:endTime]
      #   r.changedCampaignIds = response[:changedCampaignIds]
      #   r.changedAdgroupIds = response[:changedAdgroupIds]
      #   r.changedKeywordIds = response[:changedKeywordIds]
      #   r.changedCreativeIds = response[:changedCreativeIds]
      #   r.changedNewCreativeIds = response[:changedNewCreativeIds]
      #   r
      # end
      # def getChangedNewCreativeId
      # end
      # def getChangedScale
      # end
      # def getAllObjects
      # end
      # def getAllChangedObjects
      # end
      # def getFileState
      # end
      # def getFilePath
      # end
      # def getChangedAdgroupId
      # end
      # def getChangedItemId
      # end
      # def getSelectedObjects
      # end
    end
  end
end
