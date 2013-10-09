require 'httparty'
module Baidu
  class Translate
    include HTTParty
    # debug_output $stderr
    base_uri 'openapi.baidu.com'

    def initialize(apikey,from=nil,to=nil)
      @from_to = %w(zh_en zh_jp en_zh jp_zh)
      @apikey = apikey
      unless from.nil? and to.nil?
        if @from_to.include?"#{from}_#{to}"
          @from,@to = from,to
        else
          warn "invalid options,only allow:#{@from_to}"
        end
      end
    end
    def translate(query,from=nil,to=nil)
      options = {
        :query =>{
          :client_id => @apikey,
          :q=>query,
          :from=>from||@from,
          :to=>to||@to
        }
      }
      response = self.class.get('/public/2.0/bmt/translate',options)
      result = []
      response['trans_result'].each do |trans|
        result << trans['dst']
      end
      result
    end
  end
end