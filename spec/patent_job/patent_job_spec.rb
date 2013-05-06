$:.unshift(File.expand_path('../../../',__FILE__))
require 'spec_helper'

describe PatentJob do
  before do
    @job = PatentJob.new
    @file = "data.csv"
    @job.stub(:update_patents).with(anything).and_return(true)
  end
  it "should download the csv file from the ftp server" do
    @job.should_receive(:download_file).and_return(@file)
    f = File.read(@job.download_file)

    f.include?('just 3 minutes').should be_true
  end

  it "should replace existing patents with new patents" do
    @job.should_receive(:download_file).and_return(@file)
    @job.run

    Patent.find(:all).should have(1).rows
    Patent.find_by_name('test').should be_true
  end

end
