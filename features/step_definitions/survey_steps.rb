Given /^there is a survey named "([^\"]*)"$/ do |name|
  @survey = Survey.create!(:name => name)
end

Given /^the survey has a question named "([^\"]*)"$/ do |name|
  @survey.questions.create! :name => name
end

Then /^the survey "([^"]*)" should have the questions:$/ do |survey_name, table|
  s = Survey.find_by_name survey_name
  table.hashes.each do |hash|
    q = s.questions.find_by_name hash[:name]
    puts "q #{q.answer_type} h #{hash[:answer_type]}"
    q.answer_type.should == hash[:answer_type]
    q.range.should == hash[:range].to_i
    q.answer1.should == hash[:answer1]
  end
end

Then /^the ([a-zA-Z]+) "([^"]*)" should be deleted$/ do |table,name|
  table.downcase.capitalize.constantize.find_by_name.should be_nil
end
