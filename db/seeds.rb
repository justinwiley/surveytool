require 'lib/sample_response_data.rb'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "Delete existing database? (y followed by Ctrl+D to delete, anything followed by ctrl+d to skip)"
#if STDIN.read =~ /y/
#  puts "Deleting"
#  Survey.delete_all
#  Question.delete_all
#  Answer.delete_all
#  Respondent.delete_all
#  Response.delete_all
#else
#  puts "Exiting"
#  exit
#end

puts "Populating database with sample survey, questions, answers"

survey_name = 'Satisfaction and Needs Assessment'

survey = Survey.create! :name => survey_name, :spoken => File.new('public/sample_audio_wave.wav'),
  :desc => 'This is an example survey that showcases some of the features available in the Survey Tool application.'

survey.questions.create! :name => 'Please rate the process to get an appointment on a scale of 1 to 5, with 1 being the lowest and 5 being the highest.',
  :answer_type => 'range', :range => 5, :spoken => File.new('public/testing.wav')

question = survey.questions.create! :name => 'What are the main reasons you have attended this clinic rather than other health care providers?',
  :answer_type => 'multiple_choice', :spoken => File.new('public/testing.wav')
question.answers.create! :name => 'A', :text => 'More convient location.'
question.answers.create! :name => 'B', :text => 'Better quality than other service providers.'
question.answers.create! :name => 'C', :text => 'Cost of Survices.'

question = survey.questions.create! :name => "Has there been a time in the last year where you needed help but have been unable to come to the clinic?", 
  :answer_type => 'multiple_choice', :spoken => File.new('public/testing.wav')
question.answers.create! :name => 'A', :text => 'Yes'
question.answers.create! :name => 'B', :text => 'No'

question = survey.questions.create! :name => "If yes, what is the reason why you didn't come to the clinic?", 
  :answer_type => 'multiple_choice', :spoken => File.new('public/testing.wav')
question.answers.create! :name => 'A', :text => 'I did not know about the clinic.'
question.answers.create! :name => 'B', :text => 'The wait took too long at the clinic.'
question.answers.create! :name => 'C', :text => 'I had to work.'
question.answers.create! :name => 'D', :text => 'Other.'

question = survey.questions.create! :name => "How satisfied were you with your most recent experience in the clinic?", 
  :answer_type => 'multiple_choice', :spoken => File.new('public/testing.wav')
question.answers.create! :name => 'A', :text => 'Very Satisfied.'
question.answers.create! :name => 'B', :text => 'Somewhat Satisfied.'
question.answers.create! :name => 'C', :text => 'Satisfied.'
question.answers.create! :name => 'E', :text => 'Neither Satisfied or Disatisfied.'
question.answers.create! :name => 'F', :text => 'Somewhat Dissatisfied.'
question.answers.create! :name => 'G', :text => 'Very Dissatisfied.'

SampleResponseData.generate(survey_name,Date.today - 30,Date.today,true,true)


puts "#{Respondent.count} total respondents, #{Response.count} total responses created"
puts "Finished"