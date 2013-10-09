require 'spec_helper'
describe Baidu::SEM::SearchService do
  subject{Baidu::SEM::SearchService.new($auth)}
  describe '#getKeywordBySearch' do
    it "cannot get any results when search for something that does't exists" do
      respsonse = subject.getKeywordBySearch({:searchWord=>'things_that_not_exist!@$@%',:searchType=>0})
      respsonse.status.should == 0
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      #@TODO
      # ap respsonse
      # res.more.should == 0
      # res.results.should == nil

      respsonse = subject.getKeywordBySearch({:searchWord=>'things_that_not_exist!@$@%',:searchType=>1})
      #@TODO
      # res.more.should == 0
      # res.results.should == nil
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # ap respsonse
    end

    it "should get some results when search for #{$searchWord}" do
      respsonse = subject.getKeywordBySearch({:searchWord=>$searchWord,:searchType=>0})
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error

      # [0,1].should include res.more
      # res.results.class.should == Array
      # res.results.first.class.should == Hash
      # res.results.first.keys.sort.should == [:keyword_id, :keyword, :adgroup_id,:adgroup_name, :campaign_id, :campaign_name].sort
    end
  end

  describe '#getAdgroupBySearch' do
    it "cannot get any adgroups when search for something that does't exists" do
      options = {:adgroupName => 'things_that_not_exist!@#$',:searchType => 0}
      respsonse = subject.getAdgroupBySearch(options)
      # ap respsonse.body
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # res.more.should == 0

      options = {:adgroupName => 'things_that_not_exist!@#$',:searchType => 1}
      respsonse = subject.getAdgroupBySearch(options)
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error

      # res.more.should == 0
    end

    it "should get some results when search for #{$searchAdgroup}" do
      options = {:adgroupName => 'brand_e_air$',:searchType => 0}
      respsonse = subject.getAdgroupBySearch(options)
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # [0,1].should include res.more
      # res.results.class.should == Hash
      # res.results.keys.sort.should == [:adgroup_id, :adgroup_name, :campaign_id, :campaign_name].sort
    end
  end

  describe '#getCampaignBySearch' do
    it "cannot get any campaign when search for something that does't exists" do
      options = {:campaignName => 'things_that_not_exist!@#$',:searchType => 0}
      respsonse = subject.getCampaignBySearch(options)
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # res.more.should == 0

      options = {:campaignName => 'things_that_not_exist!@#$',:searchType => 1}
      respsonse = subject.getCampaignBySearch(options)
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # res.more.should == 0
    end

    it "should get some results when search for #{$searchCampaign}" do
      options = {:campaignName => $searchCampaignName,:searchType => 0}
      respsonse = subject.getCampaignBySearch(options)
      expect{ApiResponse.verify(respsonse.body)}.not_to raise_error
      # [0,1].should include res.more
      # res.results.class.should == Hash
      # res.results.keys.sort.should == [:campaign_id, :campaign_name].sort
    end
  end
end
