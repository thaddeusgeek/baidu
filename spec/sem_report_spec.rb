require 'spec_helper'
describe Baidu::SEM::ReportService do
  subject{Baidu::SEM::ReportService.new($auth)}
    # before :each do
    # end

    it 'should not raise error on #getProfessionalReportId #getReportState #getReportFileUrl series test' do
      #getProfessionalReportId
      options = {
        :performanceData => [Baidu::SEM::PerformanceData::IMPRESSION, Baidu::SEM::PerformanceData::CLICK, Baidu::SEM::PerformanceData::CPC],
        :startDate => (Time.now - 24*3600).utc.iso8601,
        :endDate => Time.now.utc.iso8601,
        :statIds => [$campaign_id],
        :levelOfDetails => Baidu::SEM::LevelOfDetails::CAMPAIGN,
        :reportType => Baidu::SEM::ReportType::CAMPAIGN
      }
      response = subject.getProfessionalReportId({:reportRequestType => options})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error

      #parse report_id
      report_id = response.body[:report_id]

      #getReportState
      try_count = 0
      loop do
        response = subject.getReportState({:reportId => report_id})
        response.status.should == 0
        response.desc.should == 'success'
        response.quota.should == 2
        response.rquota.should > 0
        expect{ApiResponse.verify(response.body)}.not_to raise_error
        #verify is_generated status
        is_generated = response.body[:is_generated]
        break if is_generated == '3' or try_count > 10
        sleep 1
        try_count +=1
      end


      #getReportFileUrl
      response = subject.getReportFileUrl({:reportId => report_id})
      response.status.should == 0
      response.desc.should == 'success'
      response.quota.should == 2
      response.rquota.should > 0
      expect{ApiResponse.verify(response.body)}.not_to raise_error

    end

    it "处理过期/无效id,应返回false" do
      expect{subject.getReportState({:reportId=>'7da8438bc705c9e6e747959fafce91f2'}).body}.to raise_error
      expect{subject.getReportState({:reportId=>'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'}).body}.to raise_error
    end
end


  # describe "ReportService#getReportState" do
  #

  # end
  # describe "" do
  # end
  # describe "ReportService#getRealTimeQueryData" do
  # end
  # describe "ReportService#getRealTimePairData" do
  # end
  # describe "ReportService#getRealTimeData" do
  # end
