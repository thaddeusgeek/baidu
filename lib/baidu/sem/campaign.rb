module Baidu
  module SEM
    class CampaignSerivce < Base
      # def addCampaign(options)
      #   operation = make_operation('addCampaign')
      #   operation.header = operation_header
      #   operation.body = {
      #     :AddCampaignRequest=>{
      #       :campaignTypes=> options
      #     }
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      # end

      # def updateCampaign(options)
      #   operation = make_operation('updateCampaign')
      #   operation.header = operation_header
      #   operation.body = {
      #     :UpdateCampaignRequest=> {
      #       :campaignTypes => options
      #     }
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      # end

      # def getCampaignByCampaignId(id)
      #   operation = make_operation('getCampaignByCampaignId')
      #   operation.header = operation_header
      #   operation.body = {
      #     :GetCampaignByCampaignIdRequest=>{:campaignIds=>id.to_i}
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      #   response = operation.call
      #   if @debug
      #     p response.hash
      #   end
      # end

      # def getAllCampaign
      #   operation = make_operation('getAllCampaign')
      #   p operation_header
      #   operation.header = operation_header
      #   operation.body = {
      #     :GetAllCampaignRequest => {}
      #   }

      #   puts operation.build if @debug

      #   response = operation.call

      #   p response.hash if @debug

      #   response = response.body[:GetAllCampaignResponse]
      #   puts response.class
      # end

      # def getAllCampaignId
      #   warn 'this API may not be ready yet'
      #   operation = make_operation('getAllCampaignId')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getAllCampaignIdRequest => {}
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      #   response = operation.call
      #   if @debug
      #     p response.hash
      #   end
      #   response = response.body[:addCampaignResponse]
      # end

      # def deleteCampaign(id)
      #   operation = make_operation('deleteCampaign')
      #   operation.header = operation_header
      #   operation.body = {
      #     :DeleteCampaignRequest=>{:campaignIds=>id.to_i}
      #   }
      #   if @debug
      #     puts operation.build
      #   end
      #   response = operation.call
      #   if @debug
      #     p response.hash
      #   end
      # end
    end
  end
end