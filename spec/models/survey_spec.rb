require '../spec_helper'

describe Survey do
  before do
    @survey = Survey.create! :name => 'foo'
  end
  
  it "#total_respondents_on should return the total respondents on given date" do
    pending "date weirdness"
    Survey.record_timestamps = true
    raise Date.today.to_s + '  ' + `mysql -e 'select NOW() from dual;'`
    @survey.total_respondents_on(Date.today).should == 0
    @survey.respondents.create!
    @survey.total_respondents_on(Date.today).should == 1
    @survey.respondents.create!
    @survey.total_respondents_on(Date.today).should == 2

    @survey.respondents.create! :created_at => Date.tomorrow
    Survey.record_timestamps = true
    @survey.total_respondents_on(Date.today).should == 2
  end
  
  it "#total_respondents_on should return respondents only for the given survey" do
    pending "date weirdness"
    Survey.record_timestamps = true
    @survey.respondents.create!
    survey2 = Survey.create! :name => 'foo2'
    survey2.respondents.create!
    @survey.total_respondents_on(Date.today).should == 1
  end
  
  it '#average_response_time should calculate the difference between respondent creation time and last response for all survey respondents' do
    pending "determine real requirements"
    Survey.record_timestamps = false
    @question = Question.new(:name => 'foo', :type => 'range', :range => 5)
    respondent = @survey.respondents.create!
    response = respondent.responses.create! :question => @question, :range => 3
    response.update_attribute(:created_at,Date.today + 3.minutes)
    respondent = @survey.respondents.create!
    response = respondent.responses.create! :question => @question, :range => 3
    response.update_attribute(:created_at,Date.today + 1.minutes)
    @survey.average_response_time.should == 1.minute
    Survey.record_timestamps = true
  end
  
  it '#average_response_time_on should return average response time on given date' do
  end
end
