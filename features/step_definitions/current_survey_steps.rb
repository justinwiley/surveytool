Given /^the following current_surveys:$/ do |current_surveys|
  CurrentSurvey.create!(current_surveys.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) current_survey$/ do |pos|
  visit current_surveys_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following current_surveys:$/ do |expected_current_surveys_table|
  expected_current_surveys_table.diff!(tableish('table tr', 'td,th'))
end

When /^I choose the answer for "([^"]*)"$/ do |answer_text|
  a = Answer.find_by_text answer_text
  choose("answer_#{a.id}")
end
