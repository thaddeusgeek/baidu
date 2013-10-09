require 'spec_helper'
describe Baidu::SEM::KeywordService do
  subject{Baidu::SEM::KeywordService.new($auth)}
  let(:keyword_sample){'XJK测试关键词LZJ'}
  it "#addKeyword #updateKeyword #getKeywordByKeywordId #deleteKeyword " do
    #addKeyword
    # puts $adgroup_id
    keywordType = {:adgroupId => $adgroup_id,:keyword=>keyword_sample,:matchType => 1,:price => 1}
    response = subject.addKeyword({:keywordTypes => [keywordType]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    keyword_id = response.body[:keyword_types][:keyword_id]

    #updateKeyword
    keywordType = {:keywordId=> keyword_id,:price => 2}
    response = subject.updateKeyword({:keywordTypes=>[keywordType]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    # ap response.body

    #getKeywordByKeywordId
    sleep 3
    response = subject.getKeywordByKeywordId({:keywordIds => [keyword_id]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    # ap response.body
    keyword = response.body[:keyword_types]
    (keyword.is_a?Hash).should == true
    keyword[:keyword_id].should == keyword_id
    keyword[:adgroup_id].should == $adgroup_id
    keyword[:keyword].should == keyword_sample
    keyword[:price].should == "2.0"

    #deleteKeyword
    response = subject.deleteKeyword({:keywordIds => [keyword_id]})
    response.status.should == 0
    response.desc.should == 'success'
    response.quota.should == 2
    response.rquota.should > 0
    response.body[:result].should == '1'
  end
end
