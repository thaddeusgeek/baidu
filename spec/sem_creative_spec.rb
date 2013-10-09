require 'spec_helper'
require 'uri'
describe Baidu::SEM::CreativeService do
  subject{Baidu::SEM::CreativeService.new($auth)}
  let(:new_title){'新测试创意标题'}
  it '#addCreative #updateCreative #deleteCreative #getCreativeByCreativeId' do
    #addCreative
    creativeType = {
      :adgroupId => $adgroup_id,
      :title => '测试创意标题',
      :description1 => '测试创意首行测试创意首行测试创意首行',
      :description2 => '测试创意次行测试创意次行测试创意次行',
      :pcDestinationUrl => $pcDestinationUrl,
      :pcDisplayUrl=> URI($pcDestinationUrl).host,
      :mobileDestinationUrl => $mobileDestinationUrl,
      :mobileDisplayUrl=> URI($mobileDestinationUrl).host
    }
    # {:creativeTypes=>[{
    #   :creativeId=>"long",
    #   :adgroupId=>"long",
    #   :title=>"string",
    #   :description1=>"string",
    #   :description2=>"string",
    #   :pcDestinationUrl=>"string",
    #   :pcDisplayUrl=>"string",
    #   :mobileDestinationUrl=>"string",
    #   :mobileDisplayUrl=>"string",
    #   :pause=>"boolean",
    #   :status=>"int"}]
    #   }
    # }

    # puts subject.example('addCreative')
    response = subject.addCreative({:creativeTypes => [creativeType]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    expect{ApiResponse.verify(response.body)}.not_to raise_error

    creative_id = response.body[:creative_types][:creative_id]


    # updateCreative
    creativeType = {
      :creativeId=>creative_id,
      :title => new_title,
      :description1 => '艺龙酒店测试创意首行测试创意首行测试创意首行',
      :description2 => '艺龙酒店测试创意首行测试创意首行测试创意次行',
      :pcDestinationUrl => 'http://hotel.elong.com/beijing/'
    }
    response = subject.updateCreative(:creativeTypes => [creativeType])
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    expect{ApiResponse.verify(response.body)}.not_to raise_error

    #getCreativeByCreativeId
    sleep 3
    response = subject.getCreativeByCreativeId(:creativeIds => [creative_id])
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    response.body[:creative_types][:title].should == new_title
    expect{ApiResponse.verify(response.body)}.not_to raise_error

    #deleteCreative
    response = subject.deleteCreative({:creativeIds => [creative_id]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    response.body[:result].should == '1'
    expect{ApiResponse.verify(response.body)}.not_to raise_error
  end

end
