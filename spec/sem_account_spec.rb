require 'spec_helper'
describe Baidu::SEM::AccountService do
  subject{Baidu::SEM::AccountService.new($auth)}
  let(:options){options = {}}
  describe "#getAccountInfo" do
    it "getAccountInfo" do
      response = subject.getAccountInfo(options)
      response.status.should == 0
      response.desc.should == 'success'
      expect{ApiResponse.verify(response.body)}.not_to raise_error
    end
  end

  describe '#updateAccountInfo' do
    it "is not implemented yet" do
      pending
    end
  end
end