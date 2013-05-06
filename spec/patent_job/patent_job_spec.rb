require 'spec_helper'

describe PatentJob do
  before do
    @job = PatentJob.new
    @job.stub(:parse).and_return(true)
    @job.stub(:update_patents).with(anything).and_return(true)
  end

  it "should replace existing patents with new patents" do
    @job.should_receive(:download_file).and_return(@file)
    @job.run

    Patent.find(:all).should have(1).rows
    Patent.find_by_name('test').should be_true
  end

end
