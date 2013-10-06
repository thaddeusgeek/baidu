require 'spec_helper'
describe Baidu::SEM::CampaignService do
  subject{Baidu::SEM::CampaignService.new($auth)}
  let(:campaign_type_add){{
    :campaignName=> 'campaignName1',
    :budget => '100',
    :negativeWords => '7day',
    :exactNegativeWords => '7daysin'
  }}

  let(:campaign_type_update){{
    :campaignName => 'campaignName2',
    :budget => '101',
    :negativeWords => '8day',
    :exactNegativeWords => '8daysin'
    }}

  describe '#addCampaign #updateCampaign #deleteCampaign' do
    it "" do
      pending
      options = {:campaignTypes => [campaign_type_add]}
      response = subject.addCampaign(options)
      ap response
      expect{ApiResponse.verify(response)}.not_to raise_error
      campaignId = response[:campaign_id]
      campaign_type_update[:campaign_id] = campaign_id

      options = {:campaignTypes => [campaign_type_update]}
      response = subject.updateCampaign(options)
      ap response
      expect{ApiResponse.verify(response)}.not_to raise_error

      response = subject.deleteCampaign({:campaignIds=>[campaignId]})
      expect{ApiResponse.verify(response)}.not_to raise_error
      response[:result].should == '1'
    end
  end

  describe '#getCampaignByCampaignId' do
    it "getCampaignByCampaignId" do
      pending
      # puts '==============='
      # puts subject.example('getAllCampaign')
      # {:GetCampaignByCampaignIdRequest=>{:campaignIds=>["long"]}}
      # puts '==============='
      response = subject.getCampaignByCampaignId({:campaignIds=>['1885994']},true)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getAllCampaign' do
    it "getAllCampaign" do
      pending
      puts subject.example 'getAllCampaign'
      response = subject.getAllCampaign({},true)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

end