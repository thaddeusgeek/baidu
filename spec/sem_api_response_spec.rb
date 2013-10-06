require 'spec_helper'
describe ApiResponse do
  let(:adgroup_type_sample) {
    {
            :adgroup_id => "8888888",
         :campaign_id => "88888888",
        :adgroup_name => "测试adgroup",
           :max_price => "1.0",
      :negative_words => "测试negative_words",
               :pause => false,
              :status => "31"
  }}

  let(:campaign_adgroup) {{
      :campaign_id => "8888888",
      :adgroup_types => [{
              :adgroup_id => "8888888",
             :campaign_id => "88888888",
            :adgroup_name => "测试adgroup",
               :max_price => "1.0",
          :negative_words => "测试negative_words",
                   :pause => false,
                  :status => "31"
      }]
  }}

  subject {ApiResponse}

  it "should verify correct :campaign_id" do
    expect{subject.verify({:campaign_id => "8888888"})}.not_to raise_error
    expect{subject.verify({:campaign_id => "abc"})}.to raise_error
  end

  it "should verify :adgroup_id" do
    expect{subject.verify({:adgroup_id => "88888888"})}.not_to raise_error
    expect{subject.verify({:adgroup_id => "abc"})}.to raise_error
  end

  it "should verify :adgroup_name" do
    expect{subject.verify({:adgroup_name => "adgroup_name1"})}.not_to raise_error
    expect{subject.verify({:adgroup_name => ""})}.to raise_error
  end

  it "should verify :max_price" do
    expect{subject.verify({:max_price => "0.2"})}.not_to raise_error
    expect{subject.verify({:max_price => 0.2})}.to raise_error
    expect{subject.verify({:max_price => 'abc'})}.to raise_error
  end

  it "should verify :pause" do
    expect{subject.verify({:pause =>true})}.not_to raise_error
    expect{subject.verify({:pause =>'true'})}.to raise_error
  end

  it "should verify :status" do
    expect{subject.verify({:status => '131'})}.not_to raise_error
    expect{subject.verify({:status => ''})}.to raise_error
  end

  it "should verify :campaign_adgroups" do
    campaign_adgroups = []
    campaign_adgroups << campaign_adgroup

    expect{subject.verify(campaign_adgroup)}.not_to raise_error
    expect{subject.verify({:campaign_adgroups => campaign_adgroups})}.not_to raise_error
  end

  it "should verify :exact_negative_words" do
    exact_negative_words = []
    exact_negative_words << 'nega1'
    exact_negative_words << '否定词2'
    negative_words = {:negative_words => exact_negative_words}
    exact_negative_words = {:exact_negative_words => exact_negative_words}

    expect{subject.verify(exact_negative_words)}.not_to raise_error
    expect{subject.verify(negative_words)}.not_to raise_error
  end

  it "adgroup_types" do
    adgroup_types = []
    adgroup_types << adgroup_type_sample
    adgroup_types << adgroup_type_sample
    adgroup_types = {:adgroup_types => adgroup_types}
    adgroup_type = {:adgroup_type => adgroup_type_sample}

    expect{subject.verify(adgroup_types)}.not_to raise_error
    expect{subject.verify(adgroup_type)}.not_to raise_error
  end

  it "campaign_infos" do
    campaign_infos = {}
    campaign_infos[:campaign_id] =  '88888888'
    campaign_infos[:campaign_name] = 'campaign_name'

    expect{subject.verify({:campaign_infos => campaign_infos})}.not_to raise_error
  end
end