require 'spec_helper'

describe Baidu::SEM::AdgroupService do
  subject{Baidu::SEM::AdgroupService.new($auth)}
  describe '#getAllAdgroupId' do
    it "should return hash with correct format calling getAllAdgroupId " do
      response = subject.getAllAdgroupId
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      # response.class.should == Hash
      # response.should have_key :campaign_adgroup_ids
      # response = response[:campaign_adgroup_ids]
      # response.first.should have_key :campaign_id
      # response.first.should have_key :adgroup_ids
      # campaign_id = response.first[:campaign_id]
      # campaign_id.to_i.to_s.should == campaign_id
      # response.first[:adgroup_ids].class.should == Array
      # adgroup_id = response.first[:adgroup_ids].first
      # adgroup_id.to_i.to_s.should == adgroup_id
    end
  end

  describe '#getAdgroupIdByCampaignId' do
    # subject{Baidu::SEM::AdgroupService.new($auth)}
    it "should return hash with correct format calling getAdgroupIdByCampaignId" do
      response = subject.getAdgroupIdByCampaignId({:campaignIds=>[$campaign_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
    end
  end

  describe '#getAdgroupByCampaignId' do
    # subject{Baidu::SEM::AdgroupService.new($auth)}
    it "should return hash with correct format calling getAdgroupByCampaignId" do
      pending
      response = subject.getAdgroupByCampaignId({:campaignIds=>[$campaign_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      # response.class.should == Hash
      # response.should have_key :campaign_adgroups
    end
  end

  # describe '#getAdgroupByAdgroupId' do
  #   # subject{Baidu::SEM::AdgroupService.new($auth)}
  #   it "should return hash with correct format calling getAdgroupByAdgroupId" do
  #     pending
  #     response = subject.getAdgroupByAdgroupId({:adgroupIds => $adgroup_ids})
  #     response.status.should == 0
  #     response.desc.should == 'success'
  #     response.quota.should == 2
  #     response.rquota.should > 0
  #     expect{ApiResponse.verify(response.body)}.not_to raise_error
  #   end
  # end

  describe '#addAdgroup #updateAdgroup #getAdgroupByAdgroupId #deleteAdgroup' do
    # subject {Baidu::SEM::AdgroupService.new($aut)}
    it "is not ready yet" do
      #addAdgroup
      adgroupType_add = {:campaignId=>$campaign_id,:adgroupName=>'adgroupName1',:maxPrice=>2}
      response = subject.addAdgroup({:adgroupTypes => [adgroupType_add]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      # ap response.body
      expect{ApiResponse.verify(response.body)}.not_to raise_error

      #parse and verify adgroup_id
      adgroup_id = response.body[:adgroup_types][:adgroup_id]
      adgroup_id.to_i.to_s.should == adgroup_id

      #updateAdgroup
      adgroupType_update = {:adgroupId => adgroup_id, :adgroupName => 'adgroupName2'}
      # ap adgroupType
      response = subject.updateAdgroup({:adgroupTypes=>[adgroupType_update]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      # ap response.body
      expect{ApiResponse.verify(response.body)}.not_to raise_error

      #getAdgroupByAdgroupId
      response = subject.getAdgroupByAdgroupId({:adgroupIds=>[adgroup_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      response.body[:adgroup_types][:adgroup_name].should == 'adgroupName2'


      #deleteAdgroup
      response = subject.deleteAdgroup({:adgroupIds => [adgroup_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      # ap response.body
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      # ap response.body
      # it "is not implemented yet" do
      #   pending("this is pending before we have testing-purpose account")
      # end
    end
  end

end
