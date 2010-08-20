class SampleResponseData
  def self.answer_survey(survey,respondent,date,verbose=false)
    puts "  Answering survey for respondent #{respondent.id}" if verbose
    survey.questions.each do |question|
      answers = question.answers
      if question.multiple_choice?
        answer = answers.sort_by { rand }.first
        type = :answer
      else
        answer = rand(5) + 1
        type = :range
      end
      puts "   - selected #{answer} for question '#{question.name}'" if verbose
      respondent.responses.create! :question => question, type => answer, :created_at => date, :updated_at => date
    end
  end

  def self.generate(survey_name,start_date,end_date,verbose=false,random_respondents=false)
    survey = Survey.find_by_name survey_name
    puts "Creating sample response data for #{survey.name}" if verbose
    (start_date..end_date).each do |date|
      next if date.cwday > 5  # skip weekends
      puts date if verbose
      limit = random_respondents ? (rand(3).to_i + 2) : 3
      (1..limit).each do
        SampleResponseData.answer_survey survey, survey.respondents.create!(:created_at => date), date, verbose
      end
    end
  end
end