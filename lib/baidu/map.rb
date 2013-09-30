require 'httparty'
module Baidu
  class Map
    include HTTParty
    def initialize(key)
      @key = key
      @segments = {:ak=>@key,:output=>'json',:radius=>1000}
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
      # puts "http://api.map.baidu.com/geocoder?address=#{URI.encode(poiname)}&output=json&key=#{@key}&city=#{URI.encode(cityid)}"
      url = "http://api.map.baidu.com/geocoder?address=#{URI.encode(poiname)}&output=json&key=#{@key}&city=#{cityid}"
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
  end
end