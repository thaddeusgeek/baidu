require 'spec_helper'
describe Baidu::SEM::CampaignService do
  subject{Baidu::SEM::CampaignService.new($auth)}

  describe '#addCampaign #updateCampaign #getCampaignByCampaignId #deleteCampaign' do
    it "should not raise errors when add, update, and delete a temp campaign" do
      #addCampaign
      campaign_type_add = {
        :campaignName=> 'campaignName1',
        :budget => '100',
        :negativeWords => ['7day'],
        :exactNegativeWords => ['7daysin']
      }
      options = {:campaignTypes => [campaign_type_add]}
      response = subject.addCampaign(options)
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error

      #parse and verify campaign_id
      campaign_id = response.body[:campaign_types][:campaign_id]
      campaign_id.to_i.to_s.should == campaign_id

      #updateCampaign
      campaign_type_update =
      {
        :campaignId => campaign_id,
        :campaignName => 'campaignName3',
        :budget => '101',
        :negativeWords => ['8day'],
        :exactNegativeWords => ['8daysin']
      }
      sleep 2
      options = {:campaignTypes => [campaign_type_update]}
      response = subject.updateCampaign(options)
      ap response.body
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error

      #check the result of updateCampaign by getCampaignByCampaignId
      response = subject.getCampaignByCampaignId({:campaignIds => [campaign_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      # ap response.body
      response.body[:campaign_types][:campaign_name].should == 'campaignName3'
      response.body[:campaign_types][:budget].should == '101.0'
      response.body[:campaign_types][:negative_words].should == '8day'
      response.body[:campaign_types][:exact_negative_words].should == "8daysin"

      #deleteCampaign
      response = subject.deleteCampaign({:campaignIds=>[campaign_id]})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
      response.body[:result].should == '1'
    end
  end

  # describe '#getCampaignByCampaignId' do
  #   it "getCampaignByCampaignId" do
  #     # puts '==============='
  #     # puts subject.example('getAllCampaign')
  #     # {:GetCampaignByCampaignIdRequest=>{:campaignIds=>["long"]}}
  #     # puts '==============='
  #     response = subject.getCampaignByCampaignId({:campaignIds=>[$campaign_id]})
  #     response.status.should == 0
  #     response.desc.should == 'success'
  #     response.quota.should == 2
  #     response.rquota.should > 0
  #     expect{ApiResponse.verify(response.body)}.not_to raise_error
  #   end
  # end

  describe '#getAllCampaign' do
    it "getAllCampaign" do
      response = subject.getAllCampaign({})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error
    end
  end
end