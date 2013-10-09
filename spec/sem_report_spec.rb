require 'spec_helper'
describe Baidu::SEM::ReportService do
  subject{Baidu::SEM::ReportService.new($auth)}
    before :each do
      @options = {}
      @options[:performanceData] = [Baidu::SEM::PerformanceData::IMPRESSION, Baidu::SEM::PerformanceData::CLICK, Baidu::SEM::PerformanceData::CPC]
      @options[:startDate] = (Time.now - 24*3600).utc.iso8601
      @options[:endDate] = Time.now.utc.iso8601
      @options[:statIds] = $campaign_ids
      @options[:levelOfDetails] = Baidu::SEM::LevelOfDetails::CAMPAIGN
      @options[:reportType] = Baidu::SEM::ReportType::CAMPAIGN
    end

    # describe "ReportService#getProfessionalReportId" do
    #   @report_id = nil
    it "返回的id必须是32位数字和小写字母组合" do
      pending('need to rewrite')
      response = subject.getProfessionalReportId({:reportRequestType => @options}).body
      expect{ApiResponse.verify(response)}.not_to raise_error
      # report_id.class.should == String
      # report_id.should =~ /^[a-z0-9]{32}$/
    end

    it "处理未过期有效id(1小时内产生的）应返回ReportState中的枚举值" do
      pending('need to rewrite')
      response = subject.getProfessionalReportId({:reportRequestType => @options}).body
      report_id = response[:report_id]
      response = subject.getReportState({:reportId=>report_id}).body
      expect{ApiResponse.verify(response)}.not_to raise_error
      # report_state = response[:report_state]
      # [Baidu::SEM::ReportState::PENDING,ReportState::DOING,ReportState::DONE].should include report_state
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
