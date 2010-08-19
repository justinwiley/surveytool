Given /^there is a survey named "([^\"]*)"$/ do |name|
  @survey = Survey.create! :name => name, :desc => "Description for #{name}"
end

Given /^the survey has a question named "([^\"]*)"(?: of type "([^"]*)")?$/ do |name,type|
  @question = @survey.questions.build :name => name
  @question.answer_type = type.tr(' ','_').downcase unless type.nil?
  @question.range = 5 if type == "Range"
  @question.save!
end

Given /^the question "([^"]*)" has an answer "([^"]*)" text "([^"]*)"$/ do |question, name, text|
  @answer = Question.find_by_name(question).answers.create! :name => name, :text => text
end

Given /^the ([a-zA-Z]+) "([^"]*)" has the audio file "([^"]*)"$/ do |model_name,name,audio|
  model = model_find_by_name(model_name,name)
  model.spoken_file_name = audio
  model.spoken_file_size = '1000'
  model.spoken_content_type = 'audio/wav'
  model.save!
  model.spoken.should_not be_nil
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
  spoken = model_find_by_name(model,name).spoken
  pending
  puts spoken.url + "   " + spoken.content_type
  find("audio_tag", :src => spoken.url, :controls => 'controls', :content_type => spoken.content_type).should_not be_nil
end

Then /^I should not see audio controls for "([^"]*)"$/ do |filename|
  page.source.should_not match(/audio_tag/)
end

Then /^there should be a saved response for "([^"]*)" ([a-z]+) "([^"]*)"$/ do |question,answer_type,text|
  r = Question.find_by_name(question).responses.first
  if answer_type == 'range'
    r.range.should == text.to_i
  else
    r.answers.find_by_name(text).should_not be_nil
  end
end


def constantize_model(model)
  model.downcase.capitalize.constantize
end

def model_find_by_name(model,name)
  constantize_model(model).find_by_name name
end