require 'pathname'
path_spec = Pathname.new(__dir__)
require File.join(path_spec,'spec_helper.rb')

as = Baidu::SEM::AdgroupService.new
describe Baidu::SEM::AdgroupService do
  it "getAllAdgroupId should return hash" do
    response = as.getAllAdgroupId
    response.class.should == Hash
  end
end