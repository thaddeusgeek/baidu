require 'spec_helper'

describe Baidu::SEM::AdgroupService do
  subject{Baidu::SEM::AdgroupService.new($auth)}
  let(:options){options = {}}
  describe '#getAllAdgroupId' do
    it "should return hash with correct format calling getAllAdgroupId " do
      # pending('passed')
      response = subject.getAllAdgroupId
      expect{ApiResponse.verify(response)}.not_to raise_error
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
      pending('passed')
      response = subject.getAdgroupIdByCampaignId({:campaignIds=>$campaign_ids})
      response.class.should == Hash
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getAdgroupByCampaignId' do
    # subject{Baidu::SEM::AdgroupService.new($auth)}
    it "should return hash with correct format calling getAdgroupByCampaignId" do
      response = subject.getAdgroupByCampaignId({:campaignIds=>$campaign_ids})
      expect{ApiResponse.verify(response)}.not_to raise_error
      # response.class.should == Hash
      # response.should have_key :campaign_adgroups
    end
  end

  describe '#getAdgroupByAdgroupId' do
    # subject{Baidu::SEM::AdgroupService.new($auth)}
    it "should return hash with correct format calling getAdgroupByAdgroupId" do
      response = subject.getAdgroupByAdgroupId({:adgroupIds => $adgroup_ids})
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#addAdgroup #updateAdgroup #deleteAdgroup' do
    # subject {Baidu::SEM::AdgroupService.new($aut)}
    it "is not ready yet" do
      # campaign_id = $campaign_ids.first
      adgroupType_add = {:campaignId=>'1885994',:adgroupName=>'adgroupName',:maxPrice=>2}
      response = subject.addAdgroup({:adgroupTypes => [adgroupType_add]})
      expect{ApiResponse.verify(response)}.not_to raise_error

      adgroup_id = response[:adgroup_types][:adgroup_id]
      adgroupType_update = {:adgroupId => adgroup_id, :adgroupName => 'adgroupName2'}
      # ap adgroupType
      response = subject.updateAdgroup({:adgroupTypes=>[adgroupType_update]})
      expect{ApiResponse.verify(response)}.not_to raise_error

      response = subject.deleteAdgroup({:adgroupIds => [adgroup_id]})
      expect{ApiResponse.verify(response)}.not_to raise_error
      # it "is not implemented yet" do
      #   pending("this is pending before we have testing-purpose account")
      # end
    end
  end

end
