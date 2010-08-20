require 'lib/sample_response_data.rb'

Given /^the following reports:$/ do |reports|
  Report.create!(reports.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) report$/ do |pos|
  visit reports_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Given /^"([^"]*)" has sample respondent data$/ do |survey_name|
  SampleResponseData.generate(survey_name,Date.today - 2,Date.today,false,false)
  Respondent.count.should == 9
  Response.count.should == 18
end

Then /^I should see a timeseries graph of survey "([^"]*)"$/ do |arg1|
  page.has_content?('series: [{')
end
