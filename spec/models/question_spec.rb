require '../spec_helper'

describe Question do
  before do
    @q = Question.new :name => 'test'
  end
  
  it "should require answer_type to be within valid params" do
    @q.answer_type = 'wrong'
    @q.valid?
    @q.errors[:answer_type].should == ['is not included in the list']
    @q.answer_type = 'multiple_choice'
    @q.should be_valid
  end
  
  it "should require valid integer for range if answer_type range" do
    @q.answer_type = 'range'
    @q.valid?
    @q.errors[:range].should == ['is not a number']
    @q.range = 5
    @q.should be_valid
  end
  
  it "should not require range if answer_type is not range" do
    @q.answer_type = 'multiple_choice'
    @q.should be_valid
  end
end
