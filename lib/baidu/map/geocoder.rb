module Baidu
  module Map
    class Geocoder
      include HTTParty
      HOST = 'api.map.baidu.com'
      PATH = '/geocoder/v2/'
      def initialize(ak)
        @ak = ak
      end

      def encode(address,city)
        segments = {
          'ak'=>@ak,
          'address' => address,
          'city' => city,
          'output'=>'json'
        }

        uri = URI::HTTP.build(
          :host => @host,
          :path => @path
          :query => make_query(segments)
        ).to_s
        self.class.get(uri)
      end

      def decodoe(lng,lat)
        segments = {
          'ak'=>@ak,
          'location'=>"#{lng},#{lat}",
          'output'=>'json'
        }
        uri = URI::HTTP.build(
          :host =>
          :query=> make_query(segments)
          :path => PATH
        ).to_s
        self.class.get(uri)
      end

      private
      def make_query(segments)
        URI.encode(segments.map{|k,v|"#{k}=#{v}"}.join('&')),
      end
    end
  end
end