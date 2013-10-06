#coding:UTF-8
require 'spec_helper'

describe Baidu::Map do
	subject {Baidu::Map}
	describe "#get_cityid" do
		it "查询北京应返回131" do
			subject.get_cityid('北京').should == 131
		end
	end

	describe "#coordinate" do
		it "抓取北京医院信息,应返回正确经纬度数组" do
			xy = subject.coordinate('北京医院',131)
			xy.class.should == Array
			# xy.each do |number|
				# number.to_f.should > 0
			# end
			# xy.should == [116.421477, 39.910057]
		end
	end
end

describe Baidu::Map do
	subject{Baidu::Map.new(BAIDU_MAP_KEY)}
	let(:poi){subject.around(39.811031821584, 116.44931548023).within(1000)}
	describe '#cafe' do
		it "should return self when calling #cafe" do
			subject.cafe.is_a? Baidu::Map
			subject.bus.is_a? Baidu::Map
			subject.bank.is_a? Baidu::Map
			subject.spot.is_a? Baidu::Map
		end
	end

	describe "#bus" do
		it "抓取公交信息" do
			# poi = subject.around(39.811031821584, 116.44931548023).within(1000)
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

	describe "#bank" do
		it "抓取银行信息" do
			# poi = subject.around(39.811031821584, 116.44931548023).within(1000)
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

	describe "#cafe" do
		it "抓取餐馆信息" do
			# poi = subject.around(39.811031821584, 116.44931548023).within(1000)
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
end
