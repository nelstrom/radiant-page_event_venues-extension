require File.dirname(__FILE__) + '/../spec_helper'

describe "<r:event>" do
  dataset :events
  
  before(:each) do
    @training = pages(:morning_training)
    @workday = pages(:workday)
    @office  = pages(:the_office)
  end
  
  it "should show lazy start time for events beginning on the hour" do
    @workday.should render("<r:event:lazy_start_time/>").
      as("9am")
  end
  
  it "should show lazy end time for events ending on the hour" do
    @workday.should render("<r:event:lazy_end_time/>").
      as("5pm")
  end
  
  it "should show full time for events within the hour" do
    @training.should render("<r:event:lazy_start_time/>").
      as("6.30am")
  end
  
  it "should show full time for events within the hour" do
    @training.should render("<r:event:lazy_end_time/>").
      as("7.30am")
  end
  
  it "should show start and end times, when both provided" do
    @training.should render("<r:event:lazy_start_and_end_times/>").
      as("6.30am - 7.30am")
  end
  
  it "should show start time only, when end time not provided" do
    pages(:lunch).should render("<r:event:lazy_start_and_end_times/>").
      as("12.30pm")
  end
  
  it "should change context to the venue." do
    @workday.should render("<r:event:venue><r:title/> - <r:street_address/></r:event:venue>").
      as("The Office - High st.")
  end
  
end