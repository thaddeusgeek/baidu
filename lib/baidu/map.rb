require 'httparty'
module Baidu
  module Map
    class Place
      include HTTParty
      HOST = 'api.map.baidu.com'
      @service_path = '/place/v2'
      def initialize(ak,pagesize=10,page_num=0,scope=2)
        @ak = ak
        @segments = {:ak=>@ak,:output=>'json',:pagesize=>pagesize,:page_num => page_num,:scope=>scope}
      end

      def search(query,region)
        action_path = File.join(@service_path,__method__)
        @http_segments = @segments.clone
        @http_segments['query'] = query
        @http_segments['region'] = region
        uri = URI::HTTP.build(
          :host => HOST,
          :path => action_path,
          :query => make_query(@http_segments)
        )

        self.class.get(uri)

      end

      def detail
      end

      def eventsearch
      end

      def eventdetail
      end

      def bus
        @segments[:query]='公交站'
        self
      end

      def bank
        @segments[:query]='银行'
        self
      end

      def cafe
        @segments[:query]='餐馆'
        self
      end

      def spot
        @segments[:query]='景点'
        self
      end

      def around(lat,lng)
        @segments[:location] = "#{lat},#{lng}"
        self
      end

      def within(radius)
        @segments[:radius] = radius
        self
      end

      #得到百度地图城市id
      def self.get_cityid(cityname)
        body = get "http://api.map.baidu.com/?qt=cur&wd=#{URI.encode(cityname)}&ie=utf-8&res=api"
        return body['content']['code']
      end

      #从每条结果中解析x,y坐标
      def self.coordinate(poiname,cityid)
        # puts "http://api.map.baidu.com/geocoder?address=#{URI.encode(poiname)}&output=json&ak=#{@ak}&city=#{URI.encode(cityid)}"
        url = "http://api.map.baidu.com/geocoder/v2?address=#{URI.encode(poiname)}&output=json&ak=#{@ak}&city=#{cityid}"
        result = get url
        location = result['result']
        return nil if location.nil? or location.empty?
        location = location['location']
        return location['lng'],location['lat'] if result['status'] == 'OK'
      end

      def info
        uri = URI::HTTP.build(
          :host => 'api.map.baidu.com',
          :query=> URI.encode(@segments.map{|k,v|"#{k}=#{v}"}.join('&')),
          :path => '/place/v2/search'
        )
        self.class.get(uri.to_s)
    end
          private
      def make_query(segments)
        URI.encode(segments.map{|k,v|"#{k}=#{v}"}.join('&'))
      end
    end
  end
end