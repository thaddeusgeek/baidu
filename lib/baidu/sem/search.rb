module Baidu
  module SEM
    class SearchService < Base
      # class SearchResponse
      #   attr_accessor :more,:results
      # end

      # def getKeywordBySearch(options)
      #   operation = make_operation('getKeywordBySearch')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getKeywordBySearchRequest=> options
      #   }
      #   response = operation.call
      #   puts operation.build if @debug
      #   ap response if @debug
      #   response = response.body[:get_keyword_by_search_response]
      #   r = SearchResponse.new
      #   r.results = response[:keyword_infos]
      #   r.more = response[:more_word].to_i
      #   r
      # end


      # def getAdgroupBySearch(options)
      #   operation = make_operation('getAdgroupBySearch')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getAdgroupBySearchRequest=>options
      #   }
      #   response = operation.call

      #   if @debug
      #     puts operation.build
      #   end
      #   response = response.body[:get_adgroup_by_search_response]
      #   r = SearchResponse.new
      #   r.more = response[:more_adgroup].to_i
      #   r.results = response[:adgroup_infos]
      #   r
      # end

      # def getCampaignBySearch(options)
      #   operation = make_operation('getCampaignBySearch')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getCampaignBySearchRequest=>options
      #   }
      #   response = operation.call
      #   if @debug
      #     puts operation.build
      #   end
      #   response = response.body[:get_campaign_by_search_response]
      #   r = SearchResponse.new
      #   r.more = response[:more_campaign].to_i
      #   r.results = response[:campaign_infos]
      #   r
      # end

      # def getCountById(idType,ids,countType,status)
      #   operation = make_operation('getCountById')
      #   operation.header = operation_header
      #   operation.body = {
      #     :getCountByIdRequest=>{
      #       :idType=>idType.to_i,
      #       :ids=>ids,
      #       :countType=>countType.to_i,
      #       :status=>status.to_i
      #     }
      #   }
      #   response = operation.call
      #   if @debug
      #     puts operation.build
      #   end
      #   response.body
      # end
    end
  end
end