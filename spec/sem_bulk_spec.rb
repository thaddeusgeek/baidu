require 'spec_helper'
describe Baidu::SEM::BulkJobService do
  subject{Baidu::SEM::BulkJobService.new($auth)}
  let(:startTime){(Time.now - 24*3600).utc.iso8601}
  let(:options){{:startTime=>startTime}}
  describe '#getChangedCampaignId' do
    it "getChangedCampaignId" do
      # options = {}
      # options[:startTime] = startTime
      response = subject.getChangedCampaignId(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getChangedId' do
    it "getChangedId" do
      # options = {}
      # options[:startTime] = startTime
      response = subject.getChangedId(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getChangedNewCreativeId' do
    it "getChangedNewCreativeId" do
      # options = {}
      # options[:startTime] = startTime
      options[:newCreativeType] = 1
      response = subject.getChangedNewCreativeId(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getChangedScale' do
    it "getChangedScale" do
      response = subject.getChangedScale(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getAllObjects' do
    it "getAllObjects" do
      response = subject.getAllObjects
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getAllChangedObjects' do
    it "getAllChangedObjects" do
      response = subject.getAllChangedObjects(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getFileState' do
    it "getFileState" do
      pending('error:Last file task not finish')
      response = subject.getAllObjects
      file_id = response[:file_id]
      options[:fileId] = file_id
      response = subject.getFileState(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
      sleep 3
      response = subject.getFilePath(options)
      expect{ApiResponse.verify(response)}.not_to raise_error
    end
  end

  describe '#getChangedAdgroupId' do
    it "getChangedAdgroupId" do
      response = subject.getChangedAdgroupId(options)
      expect{ApiResponse.verify(response)}
    end
  end

  describe '#getChangedItemId' do
    it "getChangedItemId" do
      response = subject.getChangedItemId(options)
      expect{ApiResponse.verify(response)}
    end
  end

  describe '#getSelectedObjects' do
    it "getSelectedObjects" do
      response = subject.getSelectedObjects(options)
      expect{ApiResponse.verify(response)}
    end
  end
end
