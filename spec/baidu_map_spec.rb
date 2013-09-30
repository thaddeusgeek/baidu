#coding:UTF-8
require 'pathname'
path_spec = Pathname.new(__dir__)
require File.join(path_spec,'spec_helper.rb')
poiname = '北京医院'
lat,lng = 39.811031821584, 116.44931548023
radius = 1000
map = Baidu::Map.new(BAIDU_MAP_KEY)
describe Baidu::Map do
	it "should return self when calling #cafe" do
		map.cafe.class.should == Baidu::Map
	end
end

# describe Baidu::Map,"#get_baike" do
# 	it "查询北京的百科内容" do
# 		str = Baidu::Map.get_baike('北京').should include("直辖市")
# 	end
# end


describe Baidu::Map,"#get_cityid" do
	it "查询北京应返回131" do
		Baidu::Map.get_cityid('北京').should == 131
	end
end

describe Baidu::Map,"#coordinate" do
	xy = Baidu::Map.coordinate('北京医院',131)
	it "抓取北京医院信息,应返回正确经纬度数组" do
		xy.class.should == Array
		xy.each do |number|
			number.to_f.should > 0
		end
		xy.should == [116.421477, 39.910057]
	end
end

poi = map.around(lat,lng).within(radius)
describe Baidu::Map ,"#bus" do
	it "抓取公交信息" do
		bus = poi.bus.info
		bus.class.should == HTTParty::Response
		status = bus['status']
		results = bus['results']
		status.should == 0
		results.class.should == Array
		results.first.class.should == Hash
		results.first['name'].should_not == nil
	end
end

describe Baidu::Map ,"#bank" do
	it "抓取银行信息" do
		bank = poi.bank.info
		bank.class.should == HTTParty::Response
		status = bank['status']
		results = bank['results']
		status.should == 0
		results.class.should == Array
		results.first.class.should == Hash
		results.first['name'].should_not == nil
	end
end

describe Baidu::Map,"#cafe" do
	it "抓取餐馆信息" do
		cafe = poi.cafe.info
		cafe.class.should == HTTParty::Response
		status = cafe['status']
		results = cafe['results']
		status.should == 0
		results.class.should == Array
		results.first.class.should == Hash
		results.first['name'].should_not == nil
	end
end