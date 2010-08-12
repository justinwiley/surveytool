Given /^there is a survey named "([^\"]*)"$/ do |name|
  @survey = Survey.create! :name => name
end

Given /^the survey has a question named "([^\"]*)"$/ do |name|
  @question = @survey.questions.create! :name => name
end

Given /^the question "([^"]*)" has an answer "([^"]*)" text "([^"]*)"$/ do |question, name, text|
  @answer = Question.find_by_name(question).answers.create! :name => name, :text => text
end

Then /^the survey "([^"]*)" should have the questions:$/ do |survey_name, table|
  s = Survey.find_by_name survey_name
  table.hashes.each do |hash|
    q = s.questions.find_by_name hash[:name]
    q.answer_type.should == hash[:answer_type]
    q.range.should == hash[:range].to_i
  end
end

Then /^the ([a-zA-Z]+) "([^"]*)" should be deleted$/ do |model,name|
  model_find_by_name(model,name).should be_nil
end

Then /^I should see audio controls for the ([a-zA-Z]+) "([^"]*)"$/ do |model,name|
  url = model_find_by_name(model,name).spoken.url
  find("audio_tag", :src => url, :controls => 'controls')
end

Then /^I should not see audio controls for "([^"]*)"$/ do |filename|
  page.source.should_not match(/audio_tag/)
end

def constantize_model(model)
  model.downcase.capitalize.constantize
end

def model_find_by_name(model,name)
  constantize_model(model).find_by_name name
end