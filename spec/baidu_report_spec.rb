require 'spec_helper'
describe Baidu::SEM::ReportService do
    before :each do
      @rs = Baidu::SEM::ReportService.new
      @rs.username = $username
      @rs.password = $password
      @rs.token = $token
      @rs.debug = $debug

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
      report_id = @rs.getProfessionalReportId(@options)
      report_id.class.should == String
      report_id.should =~ /^[a-z0-9]{32}$/
    end

    it "处理未过期有效id(1小时内产生的）应返回ReportState中的枚举值" do
      report_id = @rs.getProfessionalReportId(@options)
      report_state = @rs.getReportState(report_id).to_i
      [Baidu::SEM::ReportState::PENDING,ReportState::DOING,ReportState::DONE].should include report_state
    end

    it "处理过期/无效id,应返回false" do
      @rs.getReportState('7da8438bc705c9e6e747959fafce91f2').should == false
      @rs.getReportState('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').should == false
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
