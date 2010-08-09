require File.dirname(__FILE__) + '/../spec_helper'

describe Survey do
  it "should be valid" do
    Survey.new.should be_valid
  end
end
