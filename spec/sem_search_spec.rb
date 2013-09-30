require 'spec_helper'
ss = Baidu::SEM::SearchService.new
ss.username = $username
ss.password = $password
ss.token = $token
ss.debug = $debug
describe Baidu::SEM::SearchService do
  describe Baidu::SEM::SearchService,'#getKeywordBySearch' do
    it "cannot get any results when search for something that does't exists" do
      res = ss.getKeywordBySearch({:searchWord=>'things_that_not_exist!@$@%',:searchType=>0})
      res.more.should == 0
      res.results.should == nil

      res = ss.getKeywordBySearch({:searchWord=>'things_that_not_exist!@$@%',:searchType=>1})
      res.more.should == 0
      res.results.should == nil
    end

    it "should get some results when search for #{$searchWord}" do
      res = ss.getKeywordBySearch({:searchWord=>$searchWord,:searchType=>0})
      [0,1].should include res.more
      res.results.class.should == Array
      res.results.first.class.should == Hash
      res.results.first.keys.sort.should == [:keyword_id, :keyword, :adgroup_id,:adgroup_name, :campaign_id, :campaign_name].sort
    end
  end

  describe Baidu::SEM::SearchService,'#getAdgroupBySearch' do
    it "cannot get any adgroups when search for something that does't exists" do
      options = {:adgroupName => 'things_that_not_exist!@#$',:searchType => 0}
      res = ss.getAdgroupBySearch(options)
      res.more.should == 0

      options = {:adgroupName => 'things_that_not_exist!@#$',:searchType => 1}
      res = ss.getAdgroupBySearch(options)
      res.more.should == 0
    end

    it "should get some results when search for #{$searchAdgroup}" do
      options = {:adgroupName => 'brand_e_air$',:searchType => 0}
      res = ss.getAdgroupBySearch(options)
      [0,1].should include res.more
      res.results.class.should == Hash
      res.results.keys.sort.should == [:adgroup_id, :adgroup_name, :campaign_id, :campaign_name].sort
    end
  end

  describe Baidu::SEM::SearchService,'#getCampaignBySearch' do
    it "cannot get any campaign when search for something that does't exists" do
      options = {:campaignName => 'things_that_not_exist!@#$',:searchType => 0}
      res = ss.getCampaignBySearch(options)
      res.more.should == 0

      options = {:campaignName => 'things_that_not_exist!@#$',:searchType => 1}
      res = ss.getCampaignBySearch(options)
      res.more.should == 0
    end

    it "should get some results when search for #{$searchCampaign}" do
      options = {:campaignName => $searchCampaignName,:searchType => 0}
      res = ss.getCampaignBySearch(options)
      [0,1].should include res.more
      res.results.class.should == Hash
      res.results.keys.sort.should == [:campaign_id, :campaign_name].sort
    end
  end
end
