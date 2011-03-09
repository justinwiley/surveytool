#require '../../lib/sample_response_data.rb'

require Rails.root.join('lib/sample_response_data.rb')

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
  SampleResponseData.generate(survey_name,Date.parse('2010-01-01'),Date.parse('2010-01-03'),false,false)
  Respondent.count.should == 3
  Response.count.should == 6
end

Then /^I should see a timeseries graph of survey "([^"]*)"(?: for "([^"]*)")?$/ do |survey_name,range|
  page.has_content?('series: [{').should be_true
  page.has_content?("name: 'Number of Respondents',").should be_true
end
