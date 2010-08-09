require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  it "should be valid" do
    Question.new.should be_valid
  end
end
